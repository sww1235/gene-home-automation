//Environment Configuration

var config = {};
config.IOT_BROKER_ENDPOINT      = "yournumber.iot.us-east-1.amazonaws.com";
config.IOT_BROKER_REGION        = "us-east-1";
config.IOT_THING_NAME           = "house";
config.params                   = { thingName: 'house' };

//Loading AWS SDK libraries
var AWS = require('aws-sdk');

AWS.config.region = config.IOT_BROKER_REGION;
//Initializing client for IoT
var iotData = new AWS.IotData({endpoint: config.IOT_BROKER_ENDPOINT});

// Route the incoming request based on type (LaunchRequest, IntentRequest,
// etc.) The JSON body of the request is provided in the event parameter.
exports.handler = function (event, context) {
    try {
        console.log("event.session.application.applicationId=" + event.session.application.applicationId);

//        if (event.session.application.applicationId !== "amzn1.ask.skill.yoursecretnumbergoeshere") {
//             context.fail("Invalid Application ID");
        }

        if (event.session.new) {
            onSessionStarted({requestId: event.request.requestId}, event.session);
        }

        if (event.request.type === "LaunchRequest") {
            onLaunch(event.request,
                event.session,
                function callback(sessionAttributes, speechletResponse) {
                    context.succeed(buildResponse(sessionAttributes, speechletResponse));
                });
        } else if (event.request.type === "IntentRequest") {
            onIntent(event.request,
                event.session,
                function callback(sessionAttributes, speechletResponse) {
                    context.succeed(buildResponse(sessionAttributes, speechletResponse));
                });
        } else if (event.request.type === "SessionEndedRequest") {
            onSessionEnded(event.request, event.session);
            context.succeed();
        }
    } catch (e) {
        context.fail("Exception: " + e);
    }
};

/**
 * Called when the session starts.
 */

function onSessionStarted(sessionStartedRequest, session) {
    console.log("onSessionStarted requestId=" + sessionStartedRequest.requestId +", sessionId=" + session.sessionId);
}

/**
 * Called when the user launches the skill without specifying what they want.
 */
function onLaunch(launchRequest, session, callback) {
    console.log("onLaunch requestId=" + launchRequest.requestId + ", sessionId=" + session.sessionId);

    // Dispatch to your skill's launch.
    getWelcomeResponse(callback);
}

/**
 * Called when the user specifies an intent for this skill.
 */
function onIntent(intentRequest, session, callback) {
    console.log("onIntent requestId=" + intentRequest.requestId + ", sessionId=" + session.sessionId);

    var intent = intentRequest.intent,
        intentName = intentRequest.intent.name;

    //intent handling
    switch (intentName){
        case "GetTemperature":
            getTemperature(intent, session, callback);
            break;
        case "GetHumidity":
            getHumidity(intent, session, callback);
            break;
        case "AMAZON.HelpIntent":
            getHelp(callback);
            break;
        case "AMAZON.StopIntent":
        case "AMAZON.CancelIntent":
            handleSessionEndRequest(callback);
            break;
        default:
            throw "Invalid intent";
    }
}

/**
 * Called when the user ends the session.
 * Is not called when the skill returns shouldEndSession=true.
 */
function onSessionEnded(sessionEndedRequest, session) {
    console.log("onSessionEnded requestId=" + sessionEndedRequest.requestId +
        ", sessionId=" + session.sessionId);
    // Add cleanup logic here
}

// --------------- Functions that control the skill's behavior -----------------------

function getWelcomeResponse(callback) {
    var sessionAttributes = {};
    var cardTitle = "Welcome";
    var repromptText = "Are you there? What would you like to know?";
    var shouldEndSession = false;

    var speechOutput = "Desert home";
    callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
}

function getHelp(callback) {
    var cardTitle = "Help";
    var repromptText = "Are you there? What would you like to know?";
    var shouldEndSession = false;

    var speechOutput = "Welcome to Desert Home," +
        "dave is still working on what to say here,";
    callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
}

function handleSessionEndRequest(callback) {
    var cardTitle = "Session Ended";
    var speechOutput = "Thank you";
    var shouldEndSession = true;
    callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
}

function getTemperature(intent, session, callback, sayit) {
    var cardTitle = "Temperature";
    var repromptText = "";
    var sessionAttributes = {};
    var shouldEndSession = false;
    var temp = 12;

   iotData.getThingShadow(config.params, function(err, data) {
       if (err)  {
           console.log(err, err.stack); // an error occurred
           temp = "an error";
        } else {
           //console.log(data.payload);           // successful response
           var payload = JSON.parse(data.payload);
           temp = payload.state.reported.temp;
         }

        speechOutput = "The temperature is " + temp + " degrees fahrenheit,";
        callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
    });
}

function getHumidity(intent, session, callback) {
   var cardTitle = "Humidity";
   var repromptText = "";
   var sessionAttributes = {};
   var shouldEndSession = false;

   var humidity = 12;

   iotData.getThingShadow({ thingName: 'house' }, function(err, data) {
       if (err)  {
           console.log("error back from getThingShadow");
           console.log(err, err.stack); // an error occurred
           humidity = "an error";
        } else {
           //console.log(data.payload);           // successful response
           payload = JSON.parse(data.payload);
           humidity = payload.state.reported.humid;
         }

        speechOutput = "The humidity is " + humidity + " percent.";
        callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
    });
}

// --------------- Helpers that build all of the responses -----------------------
function buildSpeechletResponse(title, output, repromptText, shouldEndSession) {
    return {
        outputSpeech: {
            type: "PlainText",
            text: output
        },
        card: {
            type: "Simple",
            title: title,
            content: output
        },
        reprompt: {
            outputSpeech: {
                type: "PlainText",
                text: repromptText
            }
        },
        shouldEndSession: shouldEndSession
    };
}

function buildResponse(sessionAttributes, speechletResponse) {
    return {
        version: "1.0",
        sessionAttributes: sessionAttributes,
        response: speechletResponse
    };
}
