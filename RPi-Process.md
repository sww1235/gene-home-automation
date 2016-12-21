# Process for getting RPi setup

From [here](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-i2c)

Install Raspberrian on the SD card using NOOBS. I recommend purchasing
[this kit](https://www.adafruit.com/products/3058) as it makes getting started
with the RPi very simple and easy.

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

run the command `sudo raspi-config` and when it has loaded, select
`Advanced Options` and then `I2C` then make sure that you enable both the module
and have it loaded by default.

Now go ahead and connect one expansion board to the RPi. It does not need to be
wired in to any relays, and it does not need its external power connection. Now
run the command `sudo i2cdetect -y 1`. This will give a table that shows the in
use i2c addresses. If you connected the first expansion board (address 0x20) a
20 will show up in the first column. If this happens, everything is working just
fine.

Now we will need to configure the software that runs on the RPi that talks to
amazon:
