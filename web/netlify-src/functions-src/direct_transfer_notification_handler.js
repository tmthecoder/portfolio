var admin = require("firebase-admin")
var serviceAccount = process.env.FIREBASE_ADMIN_CREDENTIALS

exports.handler = async function(event, context) {
    const data = JSON.parse(event.body)
    admin.initializeApp({
        credential: admin.credential.cert({
            projectId: JSON.parse(serviceAccount).project_id,
            clientEmail: JSON.parse(serviceAccount).client_email,
            privateKey: JSON.parse(serviceAccount).private_key
        }),
        databaseURL: "https://crossclip-4c8bb.firebaseio.com/"
    });
    try {
        await admin.database().ref("test").set("HI")
        return {
            statusCode: 200,
            body: 'Success!'
        }
    } catch (err) {
        return {
            statusCode: 500,
            body: err.toString(),
        }
    }
}
