import {signInWithApple} from "../shared/apple_sign_in";

const AppleSignInCrossClip = async (request: any) => {
    const location = signInWithApple(request, process.env["CROSSCLIP_ANDROID_BUNDLE_ID"]!);
    return new Response('', {
        status: 302,
        headers: {
            Location: location,
            'Cache-Control': 'no-cache'
        }
    })
}

export default AppleSignInCrossClip
