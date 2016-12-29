# Process for getting Raspberry Pi setup

Note before proceeding: Amazon does charge for these services, however there is
a 1 year free trial and after the trial expires, the typical user will only
experience around $0.25 a month maximum. The pricing is linked
[here](https://aws.amazon.com/iot-platform/pricing/), however we will be using
the US East (N. Virginia) datacenter for the IoT stuff.

**Note:** I will be abreviating Raspberry Pi as RPi in this document.

## Raspberry Pi setup Part 0

I recommend purchasing [this kit](https://www.adafruit.com/products/3058) for
the RPi as it makes getting started with the RPi very simple and easy.

You will also need a monitor with an HDMI input such as a TV, a HDMI cable, as
well as a spare USB keyboard and mouse. **Note:** you will just need these
things for configuring the RPi, not when it is in operation.

Insert the included micro SD card into the RPi.

Connect the HDMI cable between the monitor and the RPi.

Plug the keyboard and mouse into any of the USB ports on the RPi.

Connect an ethernet cable between your [Apple Airport
Router](https://d3nevzfk7ii3be.cloudfront.net/igi/gAYpkB42MaCEptaN.large) and
the Rpi. Either I or Malcolm can help walk you through this if you are confused.
You may need to disconnect your new Mac Pro in order to hook the RPi up
temporarily. You cannot use WIFI as this will be unavailable after installing
the actual operating system.


Connect the included USB power adapter to the RPi and then plug the adapter in
to a power outlet.

The RPi should boot up into NOOBS (New Out Of Box Software) which should prompt
you to setup your language preferences and keyboard layout and then present you
with a list of operating systems to install on the RPi. If it does not prompt
you, make sure to change the language dropdown at the bottom of the screen to
`English (US)` and the keyboard dropdown to `US`. You will want to select
`RASPBIAN JESSIE LITE` as this is a basic commandline based OS without a GUI as
you will not need it since the RPi will be running headless for most of the
time.

Once all these options are set, hit the `install` button at the top of the
screen and sit back and wait.

Once the operating system has installed, the RPi will reboot and display a black
screen with a prompt for a user. Enter the default user which is `pi` and hit
enter. Now enter the default password at the next prompt which is `raspberry`.
We will be changing these ASAP so do not worry.

**Note:** Anything including usernames, passwords and commands that is typed
into the RPi are case sensitive.

## Raspberry Pi setup Part 1

You will now need to run some commands to finish setting up the RPi. To run a
command you will type it in at the prompt which will look something like this:
`pi@raspberrypi:~ $`, and then hit the `enter` key. You will always need to wait
for this prompt to appear before running another command. You may be prompted
for a password after some of these commands. Type in the default password from
`Part 0` above.

First you will need to expand the OS partition to the entire SD card and enable
the i2c ports on the RPi which will enable communication with the expansion
modules. Run the command:

```bash
sudo raspi-config
```

The built-in configuration tool will appear. You will need to select option \#1
`Expand Filesystem` using the arrow keys on your keyboard and press enter. A
message will appear saying that the boot partition has been resized. Select OK
using arrow keys on your keyboard and press Enter. The main menu will reappear.

Now select \#5 `International Options` and then `Change Locale`. You will want
to change it to `en.US.UTF-8 UTF8`. To do this, you must first deselect the
default `en_GB.UTF-8 UTF8` by selecting it with the arrow keys and pressing the
space bar. Now find the US location and select it by pressing the space bar with
it highlighted. Hit the enter key when you are done and a popup will appear
asking you to select the default locale used for the entire system. Select the
same locale you selected previously, `en.US.UTF-8 UTF8`, by highlighting it
using the up and down arrow keys and then press Enter. You will be returned to
the main menu.

Now select `Advanced Options` and then `I2C` then make sure that you enable both
the module and have it loaded by default. Make these selections using the arrow
keys and the enter key.

Select Finish at the bottom of the menu and press Enter. A popup message will
ask you to reboot your Raspberry Pi. Select yes and wait for the RPi to reboot.
If the pi does not automatically reboot, wait to be returned to a prompt and
type in `sudo reboot`, and type in the default password when prompted.

Now log back in using the same username and password you used before.

you will now need to configure your timezone. Run the
command `sudo raspi-config` again, and go back into the internationalization
menu. Select option \#2 `Change Timezone` and select the closest geographical
area to you.

Now reboot once more by typing in `sudo reboot` at the prompt and pressing
enter.

Now log back in using the same username and password you used before.

Now we should change the default password for the pi user. To do this, you will
need to come up with a password. I would recommend using a random word generator
or flipping through a dictionary to create a multi word passphrase with words
separated by `-` characters. At minimum I would use a single dictionary word and
then write it down. Keep in mind that the password will be case sensitive.
Another thing to keep in mind is that you will be having to type this password
frequently, so make it easy to type.

Once you have chosen a password, type `passwd` at a prompt. This will prompt you
for the old default password, then your new password. You will not see any
visual feedback that you are entering the password, so make sure you are typing
it correctly. It will then prompt you to enter your new password again as
verification.

You will now need to install most of the software that you will need to
communicate with the GPIO and Amazon. You may need to type the default password
in for some of these commands.

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install -y git python-dev python-rpi.gpio python-smbus i2c-tools mosquitto mosquitto-clients
```


**NOTE:** Make sure to wait until each command has completed before typing the
next one as some may take some time to complete.

Now go ahead and connect one expansion board to the RPi. It does not need to be
wired in to any relays, and it does not need its external power connection. Now
run the command `sudo i2cdetect -y 1`. This will give a table that shows the in
use i2c addresses. If you connected the first expansion board (address 0x20) a
20 will show up in the first column. If this happens, everything is working just
fine.

## Amazon Setup Part 1

Now we will need to configure the amazon side of things. (partially from
[here](https://developer.amazon.com/blogs/post/Tx3828JHC7O9GZ9/Using-Alexa-Skills-Kit-and-AWS-IoT-to-Voice-Control-Connected-Devices)
and partially from
[here](http://www.desert-home.com/2016/11/amazon-dot-and-my-desert-home.html))

For all the Amazon stuff you will be working with Amazon's Web Services (AWS)
which is their cloud infrastucture.

On your mac:

you will need to login to the [AWS
Console](https://console.aws.amazon.com/iot/home?region=us-east-1#/dashboard)
using your amazon account. You may need to setup an acount here, but it should
link to your existing amazon account.

You will then need to create a 'thing' which represents what you want to
control. This is essentially an object that encapsulates large amounts of
functionality like a house or an industrial waterpump.

For your house: We will create a house object.

1.  Click on `Create a resource`
1.  Click on `Create a thing`
1.  Type 'house' as the name without the single quotes
1.  Click `Create`
1.  Click on `house` in the bottom pane

This will be your newly created 'thing'. In the details pane, there will be an
entry called `REST API endpoint`. This is one of the secrets that you will need
in order to enable communication between the RPi and Amazon. Make sure to copy
and paste this somewhere as you will need it later.

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

Now click on Roles on the left side menu and create a new Role. Name it
'IoTRole'. Click on this role that you just created and make sure the permission
tab is selected. You now want to `Create Role Policy`. When prompted for a name,
use 'ForAccessToLogsAndIoT'. When prompted for the actual policy, paste the text
below including all the brackets.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iot:*",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iot:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

Now go back up to the services menu and click on the `IoT` service. Keep this
page up as you work on the next section.

## AWS configuration part 2 - Lambda functions

Log into the AWS console and select `Lambda` from the services drop down menu at
the top right.

When the next page loads, click `Create a Lambda Function`. When prompted, use
the blueprint for Node.js 4.3 and the `blank function` as you will be using the
code I provide. Click next

The next screen will want you to configure a trigger. Click the dashed box on
the left and select `Alexa Skills Set`, NOT `Alexa Smart Home`. Click next

Now you will be at the configuration screen. This is where all the testing and
coding will happen.

Name your function 'Primary Lambda' and choose the runtime Node.js 4.3.

Replace the code that appears in the box further down the page with the code
from
[here](https://raw.githubusercontent.com/sww1235/gene-home-automation/master/Code/lambda.js)

you will need to change the 4th line by replacing 'yournumber' with the first
part of the REST API endpoint secret.

## AWS configuration part 3 - Alexa Voice Function/skill

An Alexa Voice function/skill is the piece of the puzzle where you define what
voice commands you want. To access this go to the [Amazon Developer
Console](https://developer.amazon.com/home.html). You will then want to click on
`Alexa` in the top bar and then click on the `Alexa Skills Kit` not `Alexa Voice
Services`.

Click `Add a New Skill`

Make sure to select `Custom Interaction Model` under `skill type`

Enter a `name` and `invocation name` for the skill. The `name` can be anything
within Amazons requirements (2-50 characters) but the `invocation name` needs to
be something short. This is because you will be saying this every time you want
to control your lights.

See the end of this section for more information on this.

Ignore all the Global options for now and click on `Interaction Model`.

This is where you will actually configure what you want Alexa to respond to.

The first box will contain a number of 'intents' which represent an individual
voice command set.

For example: the intent would be "ControlLights" which then
contains a number of slots that represent different rooms or states. I have
provided a complete document so you can see how it is supposed to be
structured. Amazons documentation on this is
[here](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/alexa-skills-kit-interaction-model-reference)

Currently, since you only want to control lights, I have implemented one intent
with two slots
[here](https://raw.githubusercontent.com/sww1235/gene-home-automation/master/Code/skill-intents.json).
The two slots select the particular room or light and the light state.

Paste the intent file from [here](https://raw.githubusercontent.com/sww1235/gene-home-automation/master/Code/skill-intents.json) into the `Intent Schema` text box.

Now you will need to define two `Custom Slot types`. These are referenced in the
intent file as the type of the slot.

Click `Add Slot Type` and in the `Enter Type` text box type in `onOff` exactly.
Now in the `Enter Values` text box, enter the list below:

-   On
-   Off

Now click `Save`

Now we need to set up another custom slot type for all the rooms you want to
control the lights in. I would recomend entering all the rooms you could
possibly want here although I believe this list is fairly easy to change.

**Note:** These are going to be part of the command you will speak, so make sure
they are what you want to be speaking. Each of these will be a separate command
so if you want to be able to control different light groups then make sure to
define each one here. You can see I have provided some examples of this in the
list.

Click `Add Slot Type` and in the `Enter Type` text box type in `room` exactly.
Now in the `Enter Values` text box, enter the list of rooms. I have provided
some of the rooms below:

-   Office
-   Kitchen
-   Master Bedroom
-   Small Bathroom
-   Large Bathroom
-   Dining Room
-   Living Room
-   Living Room Overheads
-   Living Room Track Lights

Before clicking save here, make sure to copy and paste this list of rooms to
another document that you can access easily, as it is going to be something you
will need when you configure the RPi.

Now the final part of configuring this skill is setting up `Sample Utterances`.
These are essentially samples of the commands that you want Alexa to respond to.
These follow a very specific structure so double check for any typos. The
structure is: "Intent Name" "command".

An example using our previously defined intent would be:

```text
ControlLights turn {room} lights {state}
```

Or

```text
ControlLights {room} lights {state}
```

Notice that the text in braces are the custom slot type names from the `Intent
Schema` text box at the top of the page. These are essentially variables in the
commands so you do not have to type the same command 20 times.

I would recommend making a list of all these `Sample Utterances` as these are
going to be the actual commands you will use to interface with your house.

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
sudo pip install paho-mqtt
sudo /etc/init.d/mosquitto stop
```

## Examples

TODO: add example of complete voice command
