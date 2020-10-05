require("dotenv").config();
var signIn = require("./shared/apple_sign_in.js");

exports.handler = async function(event) {
    signIn.signInWithApple(event, process.env.CROSSCLIP_ANDROID_BUNDLE_ID)
}