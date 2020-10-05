require("dotenv").config();
var signIn = require("./shared/apple_sign_in.js");

exports.handler = function(event, callback) {
    callback(null, {
        statusCode: 302,
        headers: {
            Location: signIn.signInWithApple(event, process.env.CROSSCLIP_ANDROID_BUNDLE_ID),
            'Cache-Control': 'no-cache' // Disable caching of this response
        },
        body: '' // return body for local dev
    })
}