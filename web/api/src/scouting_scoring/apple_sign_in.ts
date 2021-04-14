import {signInWithApple} from "../shared/apple_sign_in";

const AppleSignInScoutScore = async (request: any) => {
    const location = await signInWithApple(request, process.env["FTCSCOUTSCORE_ANDROID_BUNDLE_ID"]!);
    return new Response('', {
        status: 302,
        headers: {
            Location: location,
            'Cache-Control': 'no-cache'
        }
    })
}

export default AppleSignInScoutScore
