# Process for getting RPi setup

Note before proceeding: Amazon does charge for these services, however there is
a 1 year free trial and after the trial expires, the typical user will only
experience around $0.25 a month maximum. The pricing is linked
[here](https://aws.amazon.com/iot-platform/pricing/), however we will be using
the US East (N. Virginia) datacenter for the IoT stuff.

## Raspberry Pi setup Part 1

From [here](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-i2c)

Install Raspberrian on the SD card using NOOBS. I recommend purchasing
[this kit](https://www.adafruit.com/products/3058) as it makes getting started
with the RPi very simple and easy.

TODO: add steps on setting up raspberry pi.

Open a terminal (found on the desk under the name LXTerminal) and run the
commands (by typing them and hitting enter after each line):

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git
sudo apt-get install -y python-dev
sudo apt-get install -y python-rpi.gpio
sudo apt-get install -y python-smbus
sudo apt-get install -y i2c-tools
```

This installs all the tools that we will need, to work with the GPIO and Amazon.

Now you will need to turn on the i2c ports on the RPi.

Open a terminal (you can use the existing terminal if you have not closed it)

Run the command `sudo raspi-config` and when it has loaded, select
`Advanced Options` and then `I2C` then make sure that you enable both the module
and have it loaded by default.

Now go ahead and connect one expansion board to the RPi. It does not need to be
wired in to any relays, and it does not need its external power connection. Now
run the command `sudo i2cdetect -y 1`. This will give a table that shows the in
use i2c addresses. If you connected the first expansion board (address 0x20) a
20 will show up in the first column. If this happens, everything is working just
fine.

## Amazon Setup Part 1

Now we will need to configure the amazon side of things. (partially from [here](https://developer.amazon.com/blogs/post/Tx3828JHC7O9GZ9/Using-Alexa-Skills-Kit-and-AWS-IoT-to-Voice-Control-Connected-Devices) and partially from [here](http://www.desert-home.com/2016/11/amazon-dot-and-my-desert-home.html))

For all the Amazon stuff you will be working with Amazon's Web Services (AWS)
which is their cloud infrastucture.

On another computer:

you will need to login to the [AWS Console](https://console.aws.amazon.com/iot/home?region=us-east-1#/dashboard) using your amazon account. You may need to setup an acount here, but it should link to your existing amazon account.

You will then need to create a 'thing' which represents what you want to control. This is essentially an object that encapsulates large amounts of functionality like a house or an industrial waterpump.

For your house: We will create a house object.

1.  Click on `Create a resource`
1.  Click on `Create a thing`
1.  Type 'house' as the name without the single quotes
1.  Click `Create`
1.  Click on `house` in the bottom pane

This will be your newly created 'thing'. In the details pane, there will be an
entry called `REST API endpoint`. This is one of the secrets that you will need
in order to enable communication between the RPi and Amazon.

Now you will need to create a new user in another part of AWS called Internet
Access Management (IAM). This is how the RPi and Amazon are going to be able to
communicate securely. This will be listed under services at the top. You will
click on IAM, then click on the users tab then click `create new user`. Enter a
username, lets use `piControl` for now, and click continue.

**IMPORTANT:** On the next screen you will see a link to `Show User Security
Credentials`. These are further secrets you will need to communicate between
AWS and the RPi. **These will only be shown once** so make certain to screen
shot them as well as copy-paste them somewhere safe. You may also want to
click the button that says `Download Credentials`. After this hit the `Close
button`. You should see the user you just created.

Now in order to have this user be useful, you will need to give it permission to
do things. Click on the user you just created and then click on the
`Permissions` tab. Give this user the permissions listed below:

-   AWSLambdaFullAccess
-   IAMFullAccess
-   AWSIoTFullAccess

Now go back up to the services menu and click on the `IoT` service. Keep this
page up as you work on the next section.

## Raspberry Pi setup Part 2

First you will want to open a terminal as most of what you will be doing will be
via the command line.

First you will need to create a directory(folder) to work out of:

**NOTE:** anything not proceeded by a \# is a command you type into the terminal
and hit enter after each line.

```bash
# make sure you are in your home directory
cd
# create a new directory
mkdir home-automation
# enter the directory you just created
cd home-automation
# install amazon's software on your machine
sudo pip install awscli # you may be prompted to enter your password
# now to configure the AWS interface
aws configure
# This will prompt you for the credentials you were given when you created a new
# user on AWS.
# you will also be prompted for a region. use us-east-1 as this is the only
# region that will work.
#
# Now you have to create a 'thing' on the RPi like you did on the AWS website.
aws iot create-thing --thing-name "house"
# to test that this worked, run:
aws iot list-things
# and you should get a print out with a lot of brackets and a list of 'things'
#
# Now to make sure everything is secure, you will need to create public and
# private encryption keys
#
# Create a new directory for these keys and enter it
mkdir keys
cd keys
# Now actually create the keys
# note: enter this all on one line without the '\'
aws iot create-keys-and-certificate --set-as-active \
--certificate-pem-outfile cert.pem \
--public-key-outfile publicKey.pem \
--private-key-outfile privkey.pem
# now you need to get another secret, this time called the ARN or AWS Resource
# Name. This is found in the output of the command below. It will be the line
# headed by certificateARN
aws iot list-certificates
# Now you need to get a certificate signed by AWS so you can trust them.
# Enter the below, all on one line and hit enter after '.crt'.
wget https://www.symantec.com/content/en/us/enterprise/verisign/roots/VeriSign-Class%203-Public-Primary-Certification-Authority-G5.pem -O aws-iot-rootCA.crt
# To make sure everything is fine so far, run the command below and compare its
# output to the stuff in quotes below:
# 'aws-iot-rootCA.crt  cert.pem  privkey.pem  publicKey.pem'
ls
# Now get back to our primary directory
cd ..
# now you will need to give your RPi permisson to communicate with AWS.
wget https://raw.githubusercontent.com/sww1235/gene-home-automation/master/iotpolicy.json
aws iot create-policy --policy-name "PubSubToAnyTopic" --policy-document file://iotpolicy.json
# now you need to attach this policy to your primary certificate. Replace
# CertificateARN in the quotes below with the one you saved in an earlier step.
aws iot attach-principal-policy --principal "certificateARN" --policy-name "PubSubToAnyTopic"
# now to test if everything worked.
aws iot describe-endpoint
# you should get back some brackets and and endpointAddress. Make note of this as well.
#
# Amazon uses a protocol called MQTT to communicate with the RPi. Install the
# tools you will need to work with it.
sudo apt-get install mosquitto mosquitto-clients
sudo pip install paho-mqtt
sudo /etc/init.d/mosquitto stop
```

## AWS configuration part 2
