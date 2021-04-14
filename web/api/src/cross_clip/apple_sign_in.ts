import {signInWithApple} from "../shared/apple_sign_in";

const AppleSignInCrossClip = async (request: Request) => {
    console.log(process.env["CROSSCLIP_ANDROID_BUNDLE_ID"])
    try {
        const location = await signInWithApple(request, process.env.CROSSCLIP_ANDROID_BUNDLE_ID!);
        return new Response(undefined, {
            status: 302,
            headers: {
                Location: location,
                'Cache-Control': 'no-cache'
            }
        })
    } catch (err) {
        return new Response(err)
    }
}

export default AppleSignInCrossClip
