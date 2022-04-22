const multer = require('multer')
const path = require('path')

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'upload/profile')
  },
  filename: (req, file, cb) => {
    cb(null, `profile-${file.fieldname}-${new Date().getTime()}.${file.originalname.split('.')[file.originalname.split('.').length - 1]}`)
  }
})

const fileFilter = (req, file, cb) => {
  const ext = path.extname(file.originalname)
  if (ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
    console.log('masuk error')
    return cb(new Error('Only images are allowed'), 'test')
  }
  cb(null, true)
}

const limits = {
  fileSize: 1024 * 1024
}

const uploadMovies = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: limits
}).single('picture')

const upload = async (req, res, next) => {
  console.log(req.file, 'INI DILE')
  uploadMovies(req, res, async (err) => {
    console.log(req.file, 'INI DILE dalam multer')
    if (err instanceof multer.MulterError) {
      console.log(multer.MulterError)
      return res.json({
        success: false,
        message: err.message
      })
    } else if (err) {
      console.log(err)
      return res.json({
        success: false,
        message: 'Failed to upload picture!'
      })
    }
    return next()
  })
}

module.exports = upload
