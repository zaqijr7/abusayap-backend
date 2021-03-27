const response = require('../helpers/response')
const userModel = require('../models/users')
const topUpModel = require('../models/topUp')
const { APP_URL } = process.env
const qs = require('querystring')

exports.createdTopUp = async (req, res) => {
  try {
    const data = req.body
    const { id } = req.userData
    const picture = req.file.filename

    const userData = await userModel.getUsersByCondition({ id })
    if (userData.length === 0) {
      return response(res, 404, false, 'User not found')
    }

    const initialresults = await topUpModel.createTopUp({ idUser: id, ...data, picture })
    if (initialresults.affectedRows > 0) {
      const results = await topUpModel.getTopUpByCondition({ id: initialresults.insertId })
      return response(res, 200, true, 'Thanks to top up, Waiting confirmation admin', {
        ...results[0]
      })
    }
    return response(res, 400, false, 'Top up failed')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}

exports.updateTopUp = async (req, res) => {
  try {
    const idAdmin = req.userData.id
    const { id } = req.params
    const { status } = req.body

    const topup = await topUpModel.getTopUpByCondition({ id })
    if (topup.length === 0) {
      return response(res, 404, false, 'Top up transaction not found')
    }

    const user = await userModel.getUsersByCondition({ id: topup[0].idUser })
    console.log(user[0])
    if (user.length === 0) {
      return response(res, 404, false, 'User not found')
    }
    const balance = topup[0].amount + user[0].balance

    const initialresults = await topUpModel.updateTopUp(id, { idAdmin, status })
    const updateBelance = await userModel.updateUser(topup[0].idUser, { balance: balance })
    if (initialresults.affectedRows > 0 && updateBelance.affectedRows > 0) {
      const results = await topUpModel.getTopUpByCondition({ id })
      req.socket.emit(`Update_Top_Up_${topup[0].idUser}`, topup[0].idUser)
      return response(res, 200, true, `Update status ${status === 'accept' ? status : 'reject'}`, {
        ...results[0],
        name: `${user[0].firstname} ${user[0].lastname}`
      })
    }
    return response(res, 400, false, 'Update top up failed')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}

exports.getAllTopUp = async (req, res) => {
  try {
    const cond = req.query
    cond.search = cond.search || ''
    cond.page = Number(cond.page) || 1
    cond.limit = Number(cond.limit) || 4
    cond.offset = (cond.page - 1) * cond.limit
    cond.sort = cond.sort || 'dateTransaction'
    cond.order = cond.order || 'DESC'

    const totalData = await topUpModel.getCountAllTopUp(cond)
    const totalPage = Math.ceil(Number(totalData[0].totalData) / cond.limit)

    const results = await topUpModel.getAllTopUp(cond)

    return response(res, 200, true, 'List Top Up Data', results,
      {
        totalData: totalData[0].totalData,
        currentPage: cond.page,
        totalPage,
        nextLink: cond.page < totalPage ? `${APP_URL}transaction/history?${qs.stringify({ ...req.query, ...{ page: cond.page + 1 } })}` : null,
        prevLink: cond.page > 1 ? `${APP_URL}transaction/history?${qs.stringify({ ...req.query, ...{ page: cond.page - 1 } })}` : null
      })
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}
