var publishableKey = "pk_test_51HLBHOGe8QXeWO1XU6XrMBOkeitGqlZDLYcOfjubNCHREXTOaGHEKK9dIV0WaAn9IJ009LgsQj7vWPHeRIxFtgpV00i916v6aB";
var stripe = Stripe(publishableKey);

createAndRedirect();

// Create a Checkout Session with the selected plan ID
var createCheckoutSession = function(priceId) {
    return fetch("https://tmthecoder.netlify.app/.netlify/functions/subscription_checkout", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            priceId
        })
    }).then(function(result) {
        return result.json();
    });
};

// Handle any errors returned from Checkout
var handleResult = function(result) {
    if (result.error) {
        var displayError = document.getElementById("error-message");
        displayError.textContent = result.error.message;
    }
};

function createAndRedirect(priceId) {
    if (priceId == null) {
        return;
    }
    createCheckoutSession(priceId).then(function(data) {
        // Call Stripe.js method to redirect to the new Checkout page
        console.log(data.id);
        stripe
            .redirectToCheckout({
                sessionId: data.id
            })
            .then(handleResult);
    });
};

