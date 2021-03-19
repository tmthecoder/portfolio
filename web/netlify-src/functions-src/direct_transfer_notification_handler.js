var {google} = require('googleapis');
var https = require('https');

exports.handler = async function(event, context) {
    const token = await getAccessToken();
    const options = {
        hostname: 'fcm.googleapis.com',
        path: '/v1/projects/' + process.env.CROSSCLIP_FIREBASE_ID + '/messages:send',
        method: 'POST',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        body: {
            "topic": "allDevices",
            "notification": {
                "title": "Direct Transfer Request",
                "body": "Test Request"
            }
        }
    }
    console.log("sending")
    https.request(options, function (result) {
        print(result)
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
            process.env.CROSSCLIP_PRIVATE_KEY.replace(/\\n/g, '\n'),
            SCOPES,
            null
        );
        jwtClient.authorize(function(err, tokens) {
            if (err) {
                console.log(err)
                reject(err);
                return;
            }
            resolve(tokens.access_token);
        });
    });
}

