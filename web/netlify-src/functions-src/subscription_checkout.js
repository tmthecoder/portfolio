require("dotenv").config();
const stripe = require("stripe")(process.env.STRIPE_TEST_SECRET_KEY);

const statusCode = 200;
const headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type"
};

exports.handler = async function(event) {
    if (event.httpMethod !== "POST") {
        return {
            statusCode,
            headers,
            body: "This was not a POST request!"
        };
    }

    // Parse the body contents into an object.
    const data = JSON.parse(event.body);

    // Make sure we have all required data. Otherwise, get outta here.
    if (!data.priceID) {
        const message = "Required information is missing!";

        console.error(event.body);
        console.error(message);

        return {
            statusCode,
            headers,
            body: JSON.stringify({
                status: "failed",
                message
            })
        };
    }

    const session = await stripe.checkout.sessions.create({
        mode: "subscription",
        payment_method_types: ["card"],
        line_items: [
            {
                price: data.priceID,
                quantity: 1,
            },
        ],
        success_url: `https://tmthecoder.netlify.app/#/projects`,
        cancel_url: `https://tmthecoder.netlify.app/#/about`,
    });

    res.send({
        sessionId: session.id,
    });

};