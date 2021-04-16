import { Router } from 'itty-router'
import AppleSignInCrossClip from "./cross_clip/apple_sign_in";
import AppleSignInScoutScore from "./scouting_scoring/apple_sign_in";
import DirectTransferNotification from "./cross_clip/direct_transfer_notification";

const router = Router()

router
    .post('/cross_clip/apple_sign_in', AppleSignInCrossClip)
    .post('/scouting_scoring/apple_sign_in', AppleSignInScoutScore)
    .post('/cross_clip/direct_transfer_notification', DirectTransferNotification)
    .all('*', () => new Response("Not found", { status: 404 }))

export const handleRequest = (request: Request) => {
    return router.handle(request)
}
