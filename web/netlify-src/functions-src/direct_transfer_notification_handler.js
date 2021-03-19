var admin = require("firebase-admin")

exports.handler = async function(event, context) {
    admin.initializeApp({
        credential: admin.credential.cert({
            projectId: process.env.CROSSCLIP_FIREBASE_ID,
            clientEmail: process.env.CROSSCLIP_FIREBASE_CLIENT_EMAIL,
            privateKey: process.env.CROSSCLIP_PRIVATE_KEY.replace(/\\n/g, '\n')
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
