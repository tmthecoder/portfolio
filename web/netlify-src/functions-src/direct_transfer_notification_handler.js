var {google} = require('googleapis');
var axios = require('axios');

exports.handler = async function(event, context) {
    const token = await getAccessToken();
    // const options = {
    //     hostname: 'fcm.googleapis.com',
    //     port: 443,
    //     path: '/v1/projects/' + process.env.CROSSCLIP_FIREBASE_ID + '/messages:send',
    //     method: 'POST',
    //     headers: {
    //         'Authorization': 'Bearer ' + token
    //     },
    //     body: {
    //         "message" : {
    //             "name": "direct-transfer",
    //             "topic": "allDevices",
    //             "notification": {
    //                 "title": "Direct Transfer Request",
    //                 "body": "Test Request"
    //             }
    //         },
    //     }
    // }
    console.log("sending")
    console.log(token)
    try {
        const response = await axios.post('https://fcm.googleapis.com/v1/projects/crossclip-4c8bb/messages:send', {
            "message": {
                "name": "direct-transfer",
                "topic": "allDevices",
                "notification": {
                    "title": "Direct Transfer Request",
                    "body": "Test Request"
                }
            },
        }, {
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
        console.log(response)
    } catch (error) {
        console.log(error)
    }

    // request.on('error', function(e) {
    //     console.error('error');
    //     console.error(e);
    // });

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

