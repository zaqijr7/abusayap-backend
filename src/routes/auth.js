const routes = require('express').Router()
const authController = require('../controllers/auth')
const authMiddleware = require('../middleware/auth')

routes.post('/sign-up', authController.signUp)
routes.post('/login', authController.login)
routes.post('/logout', authMiddleware.authCheck, authController.logout)
routes.patch('/pin/:id', authController.createPin)
routes.post('/forgotPassword', authController.forgotPassword)
routes.post('/forgotPasswordMobile', authController.forgotPasswordMobile)
routes.get('/verification/:id', authController.verificationEmail)
routes.patch('/resetPassword/:token', authController.resetPassword)
routes.patch('/resetPasswordMobile/:id', authController.resetPasswordMobile)

module.exports = routes
