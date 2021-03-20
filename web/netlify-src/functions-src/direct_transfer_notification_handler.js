var {google} = require('googleapis');
var axios = require('axios');

const errorCode = 502;
const headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type"
};

exports.handler = async function(event, context) {
    // Get the access token
    const token = await getAccessToken();
    if (event.httpMethod !== "POST") {
        return {
            errorCode,
            headers,
            body: "This was not a POST request!"
        };
    }
    const data = JSON.parse(event.body);
    const recipientId = data.recipient_id;
    try {
        // Post the notification to the correct user id
        await axios.post('https://fcm.googleapis.com/v1/projects/crossclip-4c8bb/messages:send', {
            "message": {
                "name": "direct-transfer",
                "token": recipientId,
                "notification": {
                    "title": "CrossClip Direct",
                    "body": "Request From " + data.sender_name + ". Click to Accept!",
                },
                "data": {
                    "type": "direct-transfer",
                    "sender-id": data.sender_id,
                }
            },
        }, {
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
        return {
            statusCode: 200,
            headers,
            body: "Success"
        }
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
        const SCOPES = [
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

