require("dotenv").config();
var signIn = require("./shared/apple_sign_in.js");

exports.handler = function(event, context, callback) {
    var location = signIn.signInWithApple(event, process.env.CROSSCLIP_ANDROID_BUNDLE_ID)
    // callback(null, {
    //     statusCode: 302,
    //     headers: {
    //         Location: location,
    //         'Cache-Control': 'no-cache' // Disable caching of this response
    //     },
    //     body: '' // return body for local dev
    // })
    console.log(location)
    if (event.httpMethod !== "POST") {
        return {
            statusCode,
            headers,
            body: "This was not a POST request!"
        };
    }
    const redirect = `intent://callback?${new URLSearchParams(
        event.body
    ).toString()}#Intent;package=${
        packageID
    };scheme=signinwithapple;end`;
    console.log(`Redirecting to ${redirect}`);
    callback(null, {
        statusCode: 302,
        headers: {
            Location: redirect,
            'Cache-Control': 'no-cache' // Disable caching of this response
        },
        body: '' // return body for local dev
    })
}