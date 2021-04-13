export function signInWithApple(request: any, packageId: String) {
    if (request.method !== 'POST') {
        throw new Error('Method not POST');
    }

    let params = new URLSearchParams(request.body).toString()
    let intentStr = '#Intent;package=' + packageId
    return 'intent://' + params + intentStr;
};
