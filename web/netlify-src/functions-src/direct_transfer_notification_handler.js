var google = require('googleapis');
var https = require('https');

exports.handler = async function(event, context) {
    const token = await getAccessToken();
    const options = {
        hostname: 'fcm.googleapis.com',
        path: '/v1/projects/' + process.env.CROSSCLIP_FIREBASE_ID + '/messages:send',
        method: 'POST',
        headers: {
            'Authorization': token
        },
        body: {
            notification: {
                title: "Direct Transfer Request",
                body: "Test Request"
            }
        }
    }
    const reqeuest = https.request(options, function(resp) {
        console.log(resp)
    })
}

function getAccessToken() {
    return new Promise(function(resolve, reject) {
        var SCOPES = [
            'https://www.googleapis.com/auth/firebase.messaging'
        ];
        const jwtClient = new google.auth.JWT(
            process.env.CROSSCLIP_FIREBASE_CLIENT_EMAIL,
            null,
            process.env.CROSSCLIP_PRIVATE_KEY,
            SCOPES,
            null
        );
        jwtClient.authorize(function(err, tokens) {
            if (err) {
                reject(err);
                return;
            }
            resolve(tokens.access_token);
        });
    });
}

