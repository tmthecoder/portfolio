export async function signInWithApple(request: Request, packageId: String) {
    if (request.method !== 'POST') {
        throw new Error('Method not POST');
    }
    let params = new URLSearchParams(await request.text()).toString()
    let intentStr = '#Intent;package=' + packageId + ';scheme=signinwithapple;end'
    return 'intent://callback?' + params + intentStr;
};
