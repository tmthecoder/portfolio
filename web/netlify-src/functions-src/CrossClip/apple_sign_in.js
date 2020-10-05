require("dotenv").config();
const AppleAuth = require("apple-auth");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");

exports.handler = async function(event) {
    if (event.httpMethod !== "POST") {
        return {
            statusCode,
            headers,
            body: "This was not a POST request!"
        };
    }
    const redirect = `intent://callback?${new URLSearchParams(
        request.body
    ).toString()}#Intent;package=${
        process.env.ANDROID_PACKAGE_IDENTIFIER
    };scheme=signinwithapple;end`;
    console.log(`Redirecting to ${redirect}`);
    response.redirect(307, redirect);
}