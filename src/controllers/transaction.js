const { APP_URL } = process.env
const transactionModel = require('../models/transaction')
const userModel = require('../models/users')
const response = require('../helpers/response')
const bcrypt = require('bcrypt')
const qs = require('querystring')
const { sendNotif } = require('../helpers/firebase')

exports.createTransaction = async (req, res) => {
  try {
    const data = req.body
    const pinUser = await userModel.getUsersByCondition({ id: req.userData.id })
    const dataReceiver = await userModel.getUsersByCondition({ id: data.idReceiver })
    if (dataReceiver.length === 0) {
      return response(res, 400, false, 'id Receiver not found')
    }
    const compare = bcrypt.compareSync(data.pin, pinUser[0].pin)
    if (compare) {
      if (pinUser[0].balance >= data.amount) {
        const sender = await transactionModel.getAmountByUser({ idUser: req.userData.id })
        const receiver = await transactionModel.getAmountByUser({ idUser: data.idReceiver })

        if (sender[0] === undefined) {
          await transactionModel.createAmountTransaction({ idUser: req.userData.id, expense: data.amount })
        } else {
          const expense = sender[0].expense + Number(data.amount)
          console.log(expense)
          await transactionModel.updateAmountTransaction(req.userData.id, { expense: expense })
        }

        if (receiver[0] === undefined) {
          await transactionModel.createAmountTransaction({ idUser: data.idReceiver, income: data.amount })
        } else {
          const income = receiver[0].income + Number(data.amount)
          await transactionModel.updateAmountTransaction(data.idReceiver, { income: income })
        }

        const balanceDecreased = pinUser[0].balance - Number(data.amount)
        const balanceIncrease = dataReceiver[0].balance + Number(data.amount)
        await userModel.updateUser(req.userData.id, { balance: balanceDecreased })
        await userModel.updateUser(data.idReceiver, { balance: balanceIncrease })
        const results = await transactionModel.createTransaction({
          idSender: req.userData.id,
          idReceiver: data.idReceiver,
          amount: data.amount,
          notes: data.notes,
          status: data.status,
          dateTransaction: data.dateTransaction
        })
        const finalResults = await transactionModel.getUserTransactionById(results.insertId)
        const userReceiver = await userModel.getUsersByCondition({ id: finalResults[0].idReceiver })
        const myData = {
          id: finalResults[0].id,
          idSender: finalResults[0].idSender,
          amount: finalResults[0].amount,
          balance: finalResults[0].balance,
          dateTransaction: finalResults[0].dateTransaction,
          notes: finalResults[0].notes,
          receiver: [
            {
              name: `${userReceiver[0].firstname} ${userReceiver[0].lastname}`,
              picture: userReceiver[0].picture,
              phoneNumber: userReceiver[0].phoneNumber
            }
          ]
        }

        try {
          const results = await userModel.getUsersByCondition({
            id: finalResults[0].idReceiver
          })
          console.log(results)
          sendNotif(results[0].token, 'Successfully transfer', "You've got money", 'Transaction')
          req.socket.emit(`Receive_Transaction_${finalResults[0].idReceiver}`, myData)
          return response(res, 200, true, 'Transaction successfully created', myData)
        } catch (err) {
          console.log(err)
          return response(res, 200, false, 'Transaction successfully created')
        }
      } else {
        return response(res, 400, false, 'Balance is not enough')
      }
    } else {
      return response(res, 400, false, 'The pin you entered is wrong')
    }
  } catch (error) {
    console.log(error)
    return response(res, 400, false, 'Bad Request')
  }
}

exports.detailTransaction = async (req, res) => {
  try {
    const { id } = req.params
    const results = await transactionModel.getUserTransactionById(id)
    if (results.length === 1) {
      const userReceiver = await userModel.getUsersByCondition({ id: results[0].idReceiver })
      return response(res, 200, true, "Detail's Transaction", {
        id: results[0].id,
        idSender: results[0].idSender,
        amount: results[0].amount,
        balance: results[0].balance,
        dateTransaction: results[0].dateTransaction,
        notes: results[0].notes,
        receiver: [
          {
            firstname: userReceiver[0].firstname,
            lastname: userReceiver[0].lastname,
            picture: userReceiver[0].picture,
            phoneNumber: userReceiver[0].phoneNumber
          }
        ]
      })
    }
    return response(res, 404, false, 'Cant Found Detail Transaction')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.amountTransactionByUser = async (req, res) => {
  try {
    const { id } = req.params
    const results = await transactionModel.getAmountTransactionByIdUser(id)
    if (results.length === 1) {
      return response(res, 200, true, 'Amount Transaction User', results)
    }
    return response(res, 404, false, 'Cant Found Detail Transaction')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.trasactionHistory = async (req, res) => {
  try {
    const { id } = req.userData
    const cond = req.query
    cond.search = cond.search || ''
    cond.page = Number(cond.page) || 1
    cond.limit = Number(cond.limit) || 4
    cond.offset = (cond.page - 1) * cond.limit
    cond.sort = cond.sort || 'id'
    cond.order = cond.order || 'DESC'
    cond.filter = cond.filter || null

    console.log(cond.filter)

    const totalData = await transactionModel.getCountTransactionHistory(id, cond)
    const totalPage = Math.ceil(Number(totalData[0].totalData) / cond.limit)

    const results = await transactionModel.getTransactionHistory(id, cond)
    if (results.length > 0) {
      return response(
        res,
        200,
        true,
        'List of all Contact',
        results.reduce((value, item) => {
          if (item.idSender === id) {
            value.push({
              userAs: 'sender',
              ...item
            })
          } else {
            value.push({
              userAs: 'receiver',
              ...item
            })
          }
          return value
        }, []),
        {
          totalData: totalData[0].totalData,
          currentPage: cond.page,
          totalPage,
          nextLink: cond.page < totalPage ? `${APP_URL}transaction/history?${qs.stringify({ ...req.query, ...{ page: cond.page + 1 } })}` : null,
          prevLink: cond.page > 1 ? `${APP_URL}transaction/history?${qs.stringify({ ...req.query, ...{ page: cond.page - 1 } })}` : null
        }
      )
    }

    console.log(totalData)
    return response(res, 404, true, 'No transactions')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}
