require("dotenv").config();
var signIn = require("./shared/apple_sign_in.js");

exports.handler = function(event, context, callback) {
    var location = signIn.signInWithApple(event, process.env.FTCSCOUTSCORE_ANDROID_BUNDLE_ID)
    callback(null, {
        statusCode: 302,
        headers: {
            Location: location,
            'Cache-Control': 'no-cache' // Disable caching of this response
        },
        body: '' // return body for local dev
    })
}