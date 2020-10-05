
const statusCode = 200;
const headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type"
};

module.exports = {
    signInWithApple: function(event, callback, packageID){
        if (event.httpMethod !== "POST") {
            return {
                statusCode,
                headers,
                body: "This was not a POST request!"
            };
        }
        const redirect = `intent://callback?${new URLSearchParams(
            event.body
        ).toString()}#Intent;package=${
            packageID
        };scheme=signinwithapple;end`;
        console.log(`Redirecting to ${redirect}`);
        return redirect
    }
}

