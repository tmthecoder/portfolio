import { handleRequest } from './handler'

addEventListener('fetch', (event) => {
    console.debug("JERE")
    event.respondWith(handleRequest(event.request))
})
