const userModel = require('../models/users')
const response = require('../helpers/response')
const sendEmail = require('../helpers/sendEmail')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const { APP_KEY, APP_URL } = process.env

exports.signUp = async (req, res) => {
  try {
    const { username, email, password } = req.body
    const isExists = await userModel.getUsersByCondition({ email })
    if (isExists.length < 1) {
      const mapUsername = username.split(' ')
      let firstname = null
      let lastname = null
      if (mapUsername.length > 0) {
        firstname = mapUsername[0]
        lastname = mapUsername.splice(1, mapUsername.length).join(' ')
      } else {
        firstname = mapUsername[0]
      }
      const salt = await bcrypt.genSalt()
      const encryptedPassword = await bcrypt.hash(password, salt)
      let createUser = null
      if (lastname !== null) {
        createUser = await userModel.createUser({ firstname, lastname, email, password: encryptedPassword, role: 2, status: 'active', balance: 120000 })
      } else {
        createUser = await userModel.createUser({ firstname, email, password: encryptedPassword, role: 2, status: 'active', balance: 120000 })
      }
      if (createUser.insertId > 0) {
        sendEmail(createUser.insertId, `${APP_URL}/auth/verification/${createUser.insertId}`, 'Verify Email Address', "Thanks for signing up for ABUSAYAP! We're excited to have you as an early user.")
        return response(res, 200, true, 'Register Success, Please verification email!', {
          id: createUser.insertId
        })
      } else {
        return response(res, 400, false, 'Register Failed')
      }
    } else {
      return response(res, 400, false, 'Register Failed, email already exists')
    }
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.login = async (req, res) => {
  try {
    const { email, password, token: notifToken } = req.body
    const existingUser = await userModel.getUsersByCondition({ email })
    if (existingUser.length > 0) {
      if (existingUser[0].status !== 'pending') {
        const compare = bcrypt.compareSync(password, existingUser[0].password)
        if (compare) {
          const { id, email, role, firstname, lastname, phoneNumber, picture } = existingUser[0]
          const token = jwt.sign({ id, email, role, firstname, lastname, phoneNumber, picture }, APP_KEY)
          const results = {
            token: token
          }
          if (notifToken) {
            try {
              await userModel.updateUser(id, {
                token: notifToken
              })
            } catch (err) {
              return response(res, 400, false, 'Bad Request')
            }
          }
          return response(res, 200, true, 'Login succesfully', results)
        } else {
          return response(res, 401, false, 'Wrong password')
        }
      } else {
        return response(res, 401, false, 'Unverified email')
      }
    }
    return response(res, 401, false, 'Email not registered')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.verificationEmail = async (req, res) => {
  try {
    const { id } = req.params
    if (id) {
      await userModel.updateUser(id, { status: 'active' })
      return res.redirect(`https://abusayap.netlify.app/create-pin/${id}`)
    }
    return response(res, 400, false, 'Failed email verification')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.forgotPassword = async (req, res) => {
  try {
    const { email } = req.body
    const existingUser = await userModel.getUsersByCondition({ email })
    if (existingUser.length > 0) {
      const id = existingUser[0].id
      const token = jwt.sign({ id }, APP_KEY)
      sendEmail(existingUser[0].id, `https://abusayap.netlify.app/create-new-password/${token}`, 'Reset Password', 'To reset your password, click the following link and follow the instructions.')
      return response(res, 200, true, 'Please check email to reset password!', { id: token })
    }
    return response(res, 401, false, 'Email not registered')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.forgotPasswordMobile = async (req, res) => {
  try {
    const { email } = req.body
    const existingUser = await userModel.getUsersByCondition({ email })
    if (existingUser.length > 0) {
      const id = existingUser[0].id
      sendEmail(existingUser[0].id, 'https://abusayap2.netlify.app/', 'Reset Password', 'To reset your password, click the following link and follow the instructions.')
      return response(res, 200, true, 'Please check email to reset password!', { id })
    }
    return response(res, 401, false, 'Email not registered')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.resetPassword = async (req, res) => {
  try {
    const { token } = req.params
    const data = jwt.verify(token, APP_KEY)
    const password = req.body
    const salt = await bcrypt.genSalt()
    const encryptedPassword = await bcrypt.hash(password.password, salt)
    const update = await userModel.updateUser(data.id, { password: encryptedPassword })
    if (update.affectedRows > 0) {
      return response(res, 200, true, 'Reset Password Success')
    }
    return response(res, 400, false, 'Failed reset password')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.resetPasswordMobile = async (req, res) => {
  try {
    const { id } = req.params
    const password = req.body
    const salt = await bcrypt.genSalt()
    const encryptedPassword = await bcrypt.hash(password.password, salt)
    const update = await userModel.updateUser(id, { password: encryptedPassword })
    if (update.affectedRows > 0) {
      return response(res, 200, true, 'Reset Password Success')
    }
    return response(res, 400, false, 'Failed reset password')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.createPin = async (req, res) => {
  try {
    const { id } = req.params
    const { pin } = req.body
    const salt = await bcrypt.genSalt()
    const encryptedPin = await bcrypt.hash(pin, salt)
    const update = await userModel.updateUser(id, { pin: encryptedPin })
    if (update.affectedRows > 0) {
      return response(res, 200, true, 'Your PIN Was Successfully Created')
    }
    return response(res, 400, false, 'Failed Created PIN')
  } catch (error) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.logout = async (req, res) => {
  const { id } = req.userData

  try {
    await userModel.updateUser(id, {
      token: null
    })
    return response(res, 200, true, 'Success to logout')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}
