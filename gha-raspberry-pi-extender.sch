EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SW-Adafruit
LIBS:SW-con
LIBS:SW-gTransistors
LIBS:SW-Passives
LIBS:SW-Microchip
LIBS:SW-RaspberryPi-GPIO-headers
LIBS:gha-raspberry-pi-extender-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "Main Schematic"
Date "2016-12-19"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RaspberryPi-GPIO-header-logical P1
U 1 1 58586A84
P 6100 3050
F 0 "P1" H 5550 2050 60  0000 C CNN
F 1 "RaspberryPi-GPIO-header-logical" V 5300 2650 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 6100 1500 60  0001 C CNN
F 3 "http://pinout.xyz/pinout/pijack" H 6150 1600 60  0001 C CNN
F 4 "0.00@0" H 6000 900 60  0001 C CNN "Pricing"
F 5 "2x20 pin header" H 6100 1250 60  0001 C CNN "Package ID"
F 6 "Raspberry Pi" H 5900 1050 60  0001 C CNN "Manufacturer"
F 7 "Raspberry Pi GPIO headers" H 6000 1150 60  0001 C CNN "Description"
	1    6100 3050
	1    0    0    -1  
$EndComp
$Sheet
S 1250 1550 1750 1000
U 58586AAB
F0 "Relay Bank 1" 60
F1 "GPIO-Module.sch" 60
F2 "SCL" I R 3000 1750 60 
F3 "SDA" I R 3000 1900 60 
F4 "A0" I L 1250 1850 60 
F5 "A1" I L 1250 2000 60 
F6 "A2" I L 1250 2150 60 
$EndSheet
$Sheet
S 1250 2750 1750 1000
U 58595F89
F0 "Relay Bank 2" 60
F1 "GPIO-Module.sch" 60
F2 "SCL" I R 3000 2950 60 
F3 "SDA" I R 3000 3100 60 
F4 "A0" I L 1250 3050 60 
F5 "A1" I L 1250 3200 60 
F6 "A2" I L 1250 3350 60 
$EndSheet
$Sheet
S 1250 4000 1750 1000
U 58596163
F0 "Relay Bank 3" 60
F1 "GPIO-Module.sch" 60
F2 "SCL" I R 3000 4200 60 
F3 "SDA" I R 3000 4350 60 
F4 "A0" I L 1250 4300 60 
F5 "A1" I L 1250 4450 60 
F6 "A2" I L 1250 4600 60 
$EndSheet
Text Notes 1250 6250 0    60   ~ 0
Each sheet above contains the circuitry to control 8 relays.\n\nEach sheet is identical.\n\nThere can be up to 8 relay banks connected\nfor a total of 8x8=64 relays controlled.\n\nThe address pins are binary,\nproducing a 1 if tied to 5V and 0 if tied to GND\n
Text Notes 3400 2350 0    60   ~ 0
Raspberry Pi has internal pullup\nresistors on SDA and SCL pins.\nNo need to add additional ones.
$Comp
L +5V #PWR01
U 1 1 58597E7A
P 6300 1800
F 0 "#PWR01" H 6300 1650 50  0001 C CNN
F 1 "+5V" H 6300 1940 50  0000 C CNN
F 2 "" H 6300 1800 50  0000 C CNN
F 3 "" H 6300 1800 50  0000 C CNN
	1    6300 1800
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR02
U 1 1 58598916
P 6100 4550
F 0 "#PWR02" H 6100 4300 50  0001 C CNN
F 1 "GNDREF" H 6100 4400 50  0000 C CNN
F 2 "" H 6100 4550 50  0000 C CNN
F 3 "" H 6100 4550 50  0000 C CNN
	1    6100 4550
	1    0    0    -1  
$EndComp
NoConn ~ 5450 3850
NoConn ~ 5450 3750
NoConn ~ 5450 3600
NoConn ~ 5450 3500
NoConn ~ 5450 3400
NoConn ~ 5450 3300
NoConn ~ 5450 3150
NoConn ~ 5450 3050
NoConn ~ 5450 2950
NoConn ~ 5450 2850
NoConn ~ 5450 2700
NoConn ~ 5900 1900
NoConn ~ 5800 1900
NoConn ~ 6750 2450
NoConn ~ 6750 2550
NoConn ~ 6750 2650
NoConn ~ 6750 2750
NoConn ~ 6750 2850
NoConn ~ 6750 2950
NoConn ~ 6750 3050
NoConn ~ 6750 3150
NoConn ~ 6750 3250
NoConn ~ 6750 3350
NoConn ~ 6750 3500
NoConn ~ 6750 3600
NoConn ~ 6750 3700
NoConn ~ 6750 3850
NoConn ~ 6750 3950
Text Notes 6450 1900 0    60   ~ 0
5V output from\nRaspberry Pi's\ninternal regulator
Text Notes 5300 1850 0    60   ~ 0
3v3 output from\nRaspberry Pi's\ninternal regulator
Text Notes 5200 4150 1    60   ~ 0
Other serial port connections\nNot used here.
Text Notes 6850 3200 0    60   ~ 0
Extra GPIO ports for future expansion
$Comp
L GNDREF #PWR03
U 1 1 58599C4C
P 800 5050
F 0 "#PWR03" H 800 4800 50  0001 C CNN
F 1 "GNDREF" H 800 4900 50  0000 C CNN
F 2 "" H 800 5050 50  0000 C CNN
F 3 "" H 800 5050 50  0000 C CNN
	1    800  5050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 58599CEA
P 1050 1400
F 0 "#PWR04" H 1050 1250 50  0001 C CNN
F 1 "+5V" H 1050 1540 50  0000 C CNN
F 2 "" H 1050 1400 50  0000 C CNN
F 3 "" H 1050 1400 50  0000 C CNN
	1    1050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1750 3150 1750
Wire Wire Line
	3150 1750 3150 4200
Wire Wire Line
	3150 2950 3000 2950
Wire Wire Line
	3150 4200 3000 4200
Connection ~ 3150 2950
Wire Wire Line
	3000 1900 3250 1900
Wire Wire Line
	3250 1900 3250 4350
Wire Wire Line
	3250 3100 3000 3100
Wire Wire Line
	3250 4350 3000 4350
Connection ~ 3250 3100
Wire Wire Line
	5450 2500 3250 2500
Connection ~ 3250 2500
Wire Wire Line
	5450 2600 3150 2600
Connection ~ 3150 2600
Wire Wire Line
	6250 1800 6350 1800
Wire Wire Line
	6250 1800 6250 1900
Wire Wire Line
	6350 1800 6350 1900
Connection ~ 6300 1800
Wire Wire Line
	5750 4400 6450 4400
Connection ~ 5850 4400
Connection ~ 5950 4400
Connection ~ 6050 4400
Connection ~ 6150 4400
Connection ~ 6250 4400
Connection ~ 6350 4400
Wire Wire Line
	6100 4550 6100 4400
Connection ~ 6100 4400
Wire Wire Line
	800  5050 800  1850
Wire Wire Line
	800  1850 1250 1850
Wire Wire Line
	1250 2000 800  2000
Connection ~ 800  2000
Wire Wire Line
	1250 2150 800  2150
Connection ~ 800  2150
Wire Wire Line
	1250 3200 800  3200
Connection ~ 800  3200
Wire Wire Line
	1250 3350 800  3350
Connection ~ 800  3350
Wire Wire Line
	1250 4600 800  4600
Connection ~ 800  4600
Wire Wire Line
	1250 4300 800  4300
Connection ~ 800  4300
Wire Wire Line
	1050 1400 1050 4450
Wire Wire Line
	1050 3050 1250 3050
Wire Wire Line
	1050 4450 1250 4450
Connection ~ 1050 3050
Text Notes 1500 2100 0    60   ~ 0
Address 0\n0x4+0x2+0x1
Text Notes 1500 3300 0    60   ~ 0
Address 1\n0x4+0x2+1x1
Text Notes 1500 4550 0    60   ~ 0
Address 2\n0x4+1x2+0x1
Text Notes 5400 5400 0    60   ~ 0
Raspberry Pi will need an ethernet connection\nand an external USB power adapter.
Text Notes 6300 1550 0    60   ~ 0
Make sure to connect\nboth 5V pins to 5V bus.\nThis connection exists\nwithin the Raspberry Pi
Text Notes 6550 4750 0    60   ~ 0
Not all ground pins\nneed be connected\ntogether externally. \nUse 2 at minimum.\nConnected internally
$Comp
L PWR_FLAG #FLG05
U 1 1 5859BA9D
P 5750 4400
F 0 "#FLG05" H 5750 4495 50  0001 C CNN
F 1 "PWR_FLAG" H 5750 4580 50  0000 C CNN
F 2 "" H 5750 4400 50  0000 C CNN
F 3 "" H 5750 4400 50  0000 C CNN
	1    5750 4400
	-1   0    0    1   
$EndComp
$EndSCHEMATC
