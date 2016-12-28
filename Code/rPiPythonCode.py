#!/usr/bin/python

"""
Interfaces with AWSIoT and controls relays.

The relays are connected to a Raspberry Pi using custom i2c expansion boards

This code has been heavily inspired by David Thompson at Desert-home.com
"""

import os
import sys
import time
import ssl
import json
import pprint
import paho.mqtt.client as mqtt

from mytime import timer, checkTimer

pp = pprint.PrettyPrinter(indent=2)


def on_awsConnect(client, userdata, flags, rc):
    """
    Helper function for connection to awsMqtt.

    This is essentially boilerplate, no modifications necessary here

    Subscribing in on_connect() means that if we lose the connection and
    reconnect then subscriptions will be renewed. You still have to do the
    reconnect in code because that doesn't happen automatically
    """
    print("mqtt connection to AWSIoT returned result: " + str(rc))

    client.subscribe([(awsShadowDelta, 1),
                      (awsShadowDocuments, 1)])


def on_awsMessage(client, userdata, msg):
    """Recieve and interpret awsMqtt messages."""
    # this is so I can access the rooms variable in the function.
    global rooms

    # If you want to see the shadow documents to observe what is going on
    # uncomment the prints below.
    # print "TOPIC = ",
    # print msg.topic
    # print "PAYLOAD = ",
    payload = {}
    # take payload string and convert it into python json object
    payload = json.loads(msg.payload)
    # pp.pprint (payload)
    # print ""

    # The 'delta' message is the difference between the 'desired' entry and
    # the 'reported' entry. It's the way of telling me what needs to be changed
    # because I told alexa to do something. What I tell alexa to do goes into
    # the desired entry and the delta is then created and published. Note that
    # the delta is not removed, it has to be done specifically, hence the
    # code further down.

    if msg.topic == awsShadowDelta:
        print("got a delta")
        pp.pprint(payload["state"])
        for item in payload["state"].keys():
            if item == "eastPatioLight":
                command = str(payload["state"][item])
                print("got command for east patio light: ", command)
                # This is where you would actually do something to
                # change the state of a device.
                eastPatioLight = command
            else:
                print("I don't know about item ", item)

    # Right under here I get the entire document and compare the 'desire'
    # part to the corresponding items in the 'reported' part. When I find
    # something in the desire that is the same as something in the reported,
    # I remove the entry from the desire. If you get rid of all the entries
    # in desire, the entire desire part of the document is removed and just
    # disappears until it's needed later.

    # The reason for this is because when the desire stays around and you walk
    # over and change something by hand, AWS will generate a delta because the
    # reported is suddenly different from the desired. That means you open the
    # garage door by hand, aws senses that the desire is closed, sends a delta
    # and closes the garage door on you.

    # Fortunately, I discovered this with a light, not a garage door.

    elif msg.topic == awsShadowDocuments:
        # print "got full thing"

        # AWSIoT sends the 'reported' state back to you so you can
        # do something with it if you need to. I don't need to deal
        # with it ... yet.
        if "desired" not in payload["current"]["state"]:
            # print "'desired' not there"
            return
        desired = payload["current"]["state"]["desired"]
        reported = payload["current"]["state"]["reported"]
        # pp.pprint (reported)

        # This is probably a left over 'desired' state, which means
        # you've already changed something, but the desire is still
        # left hanging around, so compare it with the reported state
        # and if it has been satisfied, remove the desire from AWSIoT
        pp.pprint(desired)
        fixit = False
        fixitString = "{ \"state\" : { \"desired\": {"
        for item in desired.keys():
            # when updating this, you'll often encounter
            # items that aren't fully implemented yet
            # (because you're still working on them)
            # this not reported it's just to keep from dying
            if not reported.get(item):
                print("found odd item " + item)
                break
            if desired[item] == reported[item]:
                fixit = True
                print("found left over desire at", item)
                # to get rid of a desire, set it to null
                fixitString += "\"" + item + "\": null,"
        if not fixit:
            return
        # remove the trailing comma JSON doesn't like it
        fixitString = fixitString[:-1]
        fixitString += "} } }"
        print("sending:", fixitString)
        err = awsMqtt.publish("$aws/things/house/shadow/update", fixitString)
        if err[0] != 0:
            print("got error {} on publish".format(err[0]))
    else:
        print("I don't have a clue how I got here")


def updateIotShadow():
    """
    Keep the shadow updated with the latest device states.

    If you go over and push a button to turn on a light, you want the shadow
    to know so everything can work properly.
    """
    global temperature
    global barometer
    global eastPatioLight
    print("Variable states: ", temperature, barometer, eastPatioLight)
    # Create report in JSON format; this should be an object, etc.
    # but for now, this will do.
    report = "{ \"state\" : { \"reported\": {"
    report += "\"temp\": \"%s\", " % (int(round(temperature)))
    report += "\"barometer\": \"%s\", " % (int(round(barometer)))
    report += "\"eastPatioLight\": \"%s\", " % (eastPatioLight.lower())
    report += "\"lastEntry\": \"isHere\" "  # This entry is only to make it easier on me
    report += "} } }"
    # Print something to show it's alive
    print("On Tick: ", report)
    err = awsMqtt.publish(awsShadowUpdate, report)
    if err[0] != 0:
        print("got error {} on publish".format(err[0]))

# These are the three items we'll deal with in this example
# They represent real devices that measure or change something
# that have been implemented somewhere.
# temperature = 79.1
# barometer = 1234.5
# eastPatioLight = "on"


# this variable stores all the individual relay groups and their states. Make
# sure to use the list of rooms that are in the custom slot type you created on
# AWSIoT to complete this variable. I have provided some examples here so you
# know how the formatting needs to be. This is a python dictionary if you need
# to google it. (essentially a key:value store)
# notice that all the keys aka room names have to be one word here.
# 0 = off, 1=on
rooms = dict(office=0, kitchen=0, masterBedroom=0, smallBathroom=0,
            largeBathroom=0, diningRoom=0, livingRoom=0, livingRoomOverheads=0,
            livingRoomTrackLights=0)


# Actually starts here
if __name__ == "__main__":  # this line checks to see if the script is executed
                            # directly and was not imported. Essentially the
                            # main function in other languages
    # these are the two aws subscriptions you need to operate with
    # the 'delta' is for changes that need to be taken care of
    # and the 'documents' is where the various states and such
    # are kept
    awsShadowDelta = "$aws/things/house/shadow/update/delta"
    awsShadowDocuments = "$aws/things/house/shadow/update/documents"
    # this is the mqtt resource that you respond to when you change
    # something.
    awsShadowUpdate = "$aws/things/house/shadow/update"
    # create an aws mqtt client and set up the connect handlers
    awsMqtt = mqtt.Client()
    awsMqtt.on_connect = on_awsConnect
    awsMqtt.on_message = on_awsMessage
    # certificates, host and port to use. TODO: need to update the cert paths
    awsHost = "data.iot.us-east-1.amazonaws.com"
    awsPort = 8883
    caPath = "/home/pi/src/house/keys/aws-iot-rootCA.crt"
    certPath = "/home/pi/src/house/keys/cert.pem"
    keyPath = "/home/pi/src/house/keys/privkey.pem"
    # now set up encryption and connect
    awsMqtt.tls_set(caPath, certfile=certPath, keyfile=keyPath, cert_reqs=ssl.CERT_REQUIRED, tls_version=ssl.PROTOCOL_TLSv1_2, ciphers=None)
    awsMqtt.connect(awsHost, awsPort, keepalive=60)
    print("did the connect to AWSIoT")

    # Now that everything is ready start the mqtt loop
    awsMqtt.loop_start()
    print("mqtt loop started")

    # this timer fires every so often to update the
    # Amazon alexa device shadow; check 'seconds' below
    shadowUpdateTimer = timer(updateIotShadow, seconds=10)
    weatherUpdate = timer(updateWeather, seconds=3)
    print("Alexa Handling started")

    # The main loop
    print("starting main loop")
    while True:
        # Wait a bit
        checkTimer.tick()
        time.sleep(0.5)
