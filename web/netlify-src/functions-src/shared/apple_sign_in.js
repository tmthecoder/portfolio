function signInWithApple(event, packageID) {
    if (event.httpMethod !== "POST") {
        return {
            statusCode,
            headers,
            body: "This was not a POST request!"
        };
    }
    const redirect = `intent://callback?${new URLSearchParams(
        request.body
    ).toString()}#Intent;package=${
        packageID
    };scheme=signinwithapple;end`;
    console.log(`Redirecting to ${redirect}`);
    response.redirect(307, redirect);
}

