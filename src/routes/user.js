const routes = require('express').Router()
const userController = require('../controllers/user')
const authMiddleware = require('../middleware/auth')
const validator = require('../middleware/validator')
const uploadImage = require('../middleware/uploadProfile')

routes.put('/edit/:id', authMiddleware.authCheck, uploadImage, validator.updateUser, validator.valdationResult, userController.UpdateUser)
routes.get('/get/:id', authMiddleware.authCheck, userController.getDetailUser)
routes.delete('/delete/:id', authMiddleware.authCheck, userController.deletePicture)

module.exports = routes
