const { checkSchema } = require('express-validator')
const { validationResult } = require('express-validator')
const response = require('../helpers/response')
const fs = require('fs')

exports.valdationResult = (req, res, next) => {
  const errors = validationResult(req)

  if (!errors.isEmpty()) {
    if (req.file) {
      fs.unlinkSync(req.file.path)
    }
    return response(res, 400, false, errors.array()[0].msg)
  }
  return next()
}

exports.updateUser = checkSchema({
  firstname: {
    optional: { options: { nullable: true } },
    isLength: {
      options: { min: 2, max: 50 },
      errorMessage: 'First name should be at least min 2 & max 50 character'
    }
  },
  lastname: {
    optional: { options: { nullable: true } },
    isLength: {
      options: { min: 2, max: 50 },
      errorMessage: 'Last name should be at least min 2 & max 50 character'
    }
  },
  phoneNumber: {
    optional: { options: { nullable: true } },
    isLength: {
      options: { min: 2, max: 50 },
      errorMessage: 'Phone number should be at least min 2 & max 50 character'
    }
  },
  pin: {
    optional: { options: { nullable: true } },
    isLength: {
      options: { min: 6, max: 6 },
      errorMessage: 'PIN should be 6 character'
    }
  }
})

exports.transaction = checkSchema({
  pin: {
    notEmpty: {
      errorMessage: 'PIN is required.'
    },
    isNumeric: {
      errorMessage: 'PIN must to number character'
    },
    isLength: {
      options: { min: 6, max: 6 },
      errorMessage: 'PIN should be at least min 6 & max 6 character'
    }
  },
  amount: {
    notEmpty: {
      errorMessage: 'The amount to transfer is required.'
    },
    isNumeric: {
      errorMessage: 'The amout to transfer must to number character'
    },
    isLength: {
      options: { min: 2 },
      errorMessage: 'The amout should be at least min 2 character'
    }
  },
  dateTransaction: {
    notEmpty: {
      errorMessage: 'dateTransaction is required'
    }
  },
  status: {
    notEmpty: {
      errorMessage: 'status is required'
    },
    isLength: {
      options: { min: 3 },
      errorMessage: 'status should be at least min 2 character'
    }
  },
  notes: {
    notEmpty: {
      errorMessage: 'notes is required'
    },
    isLength: {
      options: { min: 2 },
      errorMessage: 'notes should be at least min 2 character'
    }
  },
  idReceiver: {
    notEmpty: {
      errorMessage: 'idReceiver is required'
    }
  }
})

exports.topUp = checkSchema({
  amount: {
    notEmpty: {
      errorMessage: 'The amount to top up is required.'
    },
    isNumeric: {
      errorMessage: 'The amout to transfer must to number character'
    },
    isLength: {
      options: { min: 2 },
      errorMessage: 'The amout should be at least min 2 character'
    }
  },
  dateTransaction: {
    notEmpty: {
      errorMessage: 'dateTransaction is required'
    }
  }

})

exports.topUpUpdate = checkSchema({
  status: {
    notEmpty: {
      errorMessage: 'status is required'
    },
    isIn: {
      options: [['accept', 'reject']],
      errorMessage: 'The status is only accept & reject'
    }
  }

})
