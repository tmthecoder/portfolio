// import axios from 'axios';
import {getTokenFromGCPServiceAccount} from "@sagi.io/workers-jwt";

const headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type"
};

const DirectTransferNotification = async (request: Request) => {
    const token = await getAccessToken();
    if (request.method !== 'POST') {
        return new Response("Not a POST Request!",{
            status: 502,
            headers: headers,
        })
    }
    const data = JSON.parse(await request.text());
    console.log("DATA " + data);
    const recipientId = data.recipient_id;
    const options = {
        headers: { 'Authorization': 'Bearer ' + token }
    };
    try {
        // console.log("post")
        // await axios.post('https://fcm.googleapis.com/v1/projects/crossclip-4c8bb/messages:send', {
        //     "message": {
        //         "name": "direct-transfer",
        //         "token": recipientId,
        //         "notification": {
        //             "title": "CrossClip Direct",
        //             "body": "Request From " + data.sender_name + ". Click to Open!",
        //         },
        //         "data": {
        //             "type": "direct-transfer",
        //             "sender-id": data.sender_id,
        //             "sender-name": data.sender_name,
        //             "file-name": data.file_name,
        //             "file-len": data.file_len
        //         }
        //     },
        // }, options)
        const body = {
            "message": {
                "name": "direct-transfer",
                "token": recipientId,
                "notification": {
                    "title": "CrossClip Direct",
                    "body": "Request From " + data.sender_name + ". Click to Open!",
                },
                "data": {
                    "type": "direct-transfer",
                    "sender-id": data.sender_id,
                    "sender-name": data.sender_name,
                    "file-name": data.file_name,
                    "file-len": data.file_len
                }
            },
        }
        const request = {
            body: JSON.stringify(body),
            method: "POST",
            headers: { 'Authorization': 'Bearer ' + token }
        }
        const resp = await fetch("https://fcm.googleapis.com/v1/projects/crossclip-4c8bb/messages:send", request)
        console.log(resp.status)
        console.log(await resp.text())
        return new Response('Success', request)
    } catch (e) {
        return new Response(e.message, {
            status: 400
        })
    }
}

export default DirectTransferNotification

async function getAccessToken() {
    try {
        const acctStr = (await CROSS_CLIP.get("CROSSCLIP_SERVICE_ACCOUNT", "json")!)
        // const serviceAccount = JSON.parse(acctStr)
        const token = await getTokenFromGCPServiceAccount({
            serviceAccountJSON: acctStr,
            aud: "https://oauth2.googleapis.com/token",
            payloadAdditions: {
                scope: [
                    'https://www.googleapis.com/auth/firebase.messaging'
                ].join(" "),
            },
        })
        return getBearerToken(token)
    } catch (e) {
        console.log(e.message);
    }
}

async function getBearerToken(jwt: string) {
    const response = await (
        await fetch("https://oauth2.googleapis.com/token", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
                assertion: jwt, // the JWT token generated in the previous step
            }),
        })
    ).json()
    return response.access_token;
}
