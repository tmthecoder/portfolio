// Create a Checkout Session with the selected plan ID
var createCheckoutSession = function(priceId) {
  return fetch("https://tmthecoder.netlify.app/.netlify/functions/subscription_checkout", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      priceId: priceId
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

var publishableKey = "pk_test_51HLBHOGe8QXeWO1XU6XrMBOkeitGqlZDLYcOfjubNCHREXTOaGHEKK9dIV0WaAn9IJ009LgsQj7vWPHeRIxFtgpV00i916v6aB";
var basicPriceId = "price_1HLIj3Ge8QXeWO1XRc8le2qs";
var proPriceId = "price_1HLIkfGe8QXeWO1X01B5MGY7";

var stripe = Stripe(publishableKey);
// Setup event handler to create a Checkout Session when button is clicked
document
    .getElementById("basic-plan-btn")
    .addEventListener("click", function(evt) {
      createCheckoutSession(basicPriceId).then(function(data) {
        // Call Stripe.js method to redirect to the new Checkout page
        stripe
            .redirectToCheckout({
              sessionId: data.sessionId
            })
            .then(handleResult);
      });
    });

// Setup event handler to create a Checkout Session when button is clicked
document
    .getElementById("pro-plan-btn")
    .addEventListener("click", function(evt) {
      createCheckoutSession(proPriceId).then(function(data) {
        // Call Stripe.js method to redirect to the new Checkout page
        stripe
            .redirectToCheckout({
              sessionId: data.sessionId
            })
            .then(handleResult);
      });
    });
