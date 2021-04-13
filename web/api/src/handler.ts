import { Router } from 'itty-router'
import AppleSignInCrossClip from "./cross_clip/apple_sign_in";
import AppleSignInScoutScore from "./scouting_scoring/apple_sign_in";

const router = Router()

router
    .get('/crossclip/apple_sign_in', AppleSignInCrossClip)
    .get('/scouting_scoring/apple_sign_in', AppleSignInScoutScore)

export const handleRequest = (request: any) => router.handle(request)
