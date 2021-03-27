// ===== Firebase
// import all modules
const admin = require('firebase-admin')
const serviceAccount = require('./abusayap-29c07-firebase-adminsdk-6n2d6-62b1ce678a.json')

const firebase = admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
})

exports.sendNotif = (token, title, body, navs) => {
  const notif = firebase.messaging()
  notif.sendToDevice(token, {
    notification: {
      title,
      body
    },
    data: {
      navigation: navs
    }
  })
}
