require("dotenv").config();
require("./apple_sign_in");

exports.handler = async function(event) {
    signInWithApple(event, process.env.CROSSCLIP_ANDROID_BUNDLE_ID)
}