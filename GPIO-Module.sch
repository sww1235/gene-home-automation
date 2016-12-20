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
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 4
Title "Relay Bank"
Date "2016-12-19"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCP23017 U1
U 1 1 58586AF6
P 1900 2700
AR Path="/58586AAB/58586AF6" Ref="U1"  Part="1" 
AR Path="/58595F89/58586AF6" Ref="U2"  Part="1" 
AR Path="/58596163/58586AF6" Ref="U3"  Part="1" 
F 0 "U3" H 2150 1700 60  0000 C CNN
F 1 "MCP23017" H 1600 3750 60  0000 C CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_LongPads" H 2000 3100 60  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21952b.pdf" H 2200 600 60  0001 C CNN
F 4 "0.00@0" H 2000 150 60  0001 C CNN "Pricing"
F 5 "16-Bit I/O Expander with Serial Interface" H 2050 900 60  0001 C CNN "Description"
F 6 "DIP, SOP, SOIC" H 2000 750 60  0001 C CNN "Package ID"
F 7 "Microchip" H 2050 400 60  0001 C CNN "Manufacturer"
	1    1900 2700
	-1   0    0    1   
$EndComp
$Comp
L BS170 Q9
U 1 1 58586B6B
P 7800 1250
AR Path="/58586AAB/58586B6B" Ref="Q9"  Part="1" 
AR Path="/58595F89/58586B6B" Ref="Q25"  Part="1" 
AR Path="/58596163/58586B6B" Ref="Q41"  Part="1" 
F 0 "Q41" H 8000 1325 50  0000 L CNN
F 1 "BS170" H 8000 1250 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 1175 50  0000 L CIN
F 3 "" H 7800 1250 50  0000 L CNN
	1    7800 1250
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q10
U 1 1 58586C13
P 7800 1650
AR Path="/58586AAB/58586C13" Ref="Q10"  Part="1" 
AR Path="/58595F89/58586C13" Ref="Q26"  Part="1" 
AR Path="/58596163/58586C13" Ref="Q42"  Part="1" 
F 0 "Q42" H 8000 1725 50  0000 L CNN
F 1 "BS170" H 8000 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 1575 50  0000 L CIN
F 3 "" H 7800 1650 50  0000 L CNN
	1    7800 1650
	1    0    0    1   
$EndComp
$Comp
L D_Small D9
U 1 1 5858746F
P 8250 950
AR Path="/58586AAB/5858746F" Ref="D9"  Part="1" 
AR Path="/58595F89/5858746F" Ref="D25"  Part="1" 
AR Path="/58596163/5858746F" Ref="D41"  Part="1" 
F 0 "D41" H 8400 1000 50  0000 L CNN
F 1 "1N4001" H 8100 870 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 950 50  0001 C CNN
F 3 "" V 8250 950 50  0000 C CNN
	1    8250 950 
	-1   0    0    1   
$EndComp
$Comp
L D_Small D10
U 1 1 58587554
P 8250 1950
AR Path="/58586AAB/58587554" Ref="D10"  Part="1" 
AR Path="/58595F89/58587554" Ref="D26"  Part="1" 
AR Path="/58596163/58587554" Ref="D42"  Part="1" 
F 0 "D42" H 8400 1950 50  0000 L CNN
F 1 "1N4001" H 8100 2050 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 1950 50  0001 C CNN
F 3 "" V 8250 1950 50  0000 C CNN
	1    8250 1950
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P6
U 1 1 58587774
P 8850 1450
AR Path="/58586AAB/58587774" Ref="P6"  Part="1" 
AR Path="/58595F89/58587774" Ref="P14"  Part="1" 
AR Path="/58596163/58587774" Ref="P22"  Part="1" 
F 0 "P22" H 8850 1650 50  0000 C CNN
F 1 "Relay 5" V 8950 1450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 8850 1450 50  0001 C CNN
F 3 "" H 8850 1450 50  0000 C CNN
	1    8850 1450
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q11
U 1 1 58588AAA
P 7800 2500
AR Path="/58586AAB/58588AAA" Ref="Q11"  Part="1" 
AR Path="/58595F89/58588AAA" Ref="Q27"  Part="1" 
AR Path="/58596163/58588AAA" Ref="Q43"  Part="1" 
F 0 "Q43" H 8000 2575 50  0000 L CNN
F 1 "BS170" H 8000 2500 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 2425 50  0000 L CIN
F 3 "" H 7800 2500 50  0000 L CNN
	1    7800 2500
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q12
U 1 1 58588AB0
P 7800 2900
AR Path="/58586AAB/58588AB0" Ref="Q12"  Part="1" 
AR Path="/58595F89/58588AB0" Ref="Q28"  Part="1" 
AR Path="/58596163/58588AB0" Ref="Q44"  Part="1" 
F 0 "Q44" H 8000 2975 50  0000 L CNN
F 1 "BS170" H 8000 2900 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 2825 50  0000 L CIN
F 3 "" H 7800 2900 50  0000 L CNN
	1    7800 2900
	1    0    0    1   
$EndComp
$Comp
L D_Small D11
U 1 1 58588AB6
P 8250 2200
AR Path="/58586AAB/58588AB6" Ref="D11"  Part="1" 
AR Path="/58595F89/58588AB6" Ref="D27"  Part="1" 
AR Path="/58596163/58588AB6" Ref="D43"  Part="1" 
F 0 "D43" H 8400 2250 50  0000 L CNN
F 1 "1N4001" H 8100 2120 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 2200 50  0001 C CNN
F 3 "" V 8250 2200 50  0000 C CNN
	1    8250 2200
	-1   0    0    1   
$EndComp
$Comp
L D_Small D12
U 1 1 58588ABC
P 8250 3200
AR Path="/58586AAB/58588ABC" Ref="D12"  Part="1" 
AR Path="/58595F89/58588ABC" Ref="D28"  Part="1" 
AR Path="/58596163/58588ABC" Ref="D44"  Part="1" 
F 0 "D44" H 8400 3200 50  0000 L CNN
F 1 "1N4001" H 8100 3300 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 3200 50  0001 C CNN
F 3 "" V 8250 3200 50  0000 C CNN
	1    8250 3200
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P7
U 1 1 58588AC2
P 8850 2700
AR Path="/58586AAB/58588AC2" Ref="P7"  Part="1" 
AR Path="/58595F89/58588AC2" Ref="P15"  Part="1" 
AR Path="/58596163/58588AC2" Ref="P23"  Part="1" 
F 0 "P23" H 8850 2900 50  0000 C CNN
F 1 "Relay 6" V 8950 2700 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 8850 2700 50  0001 C CNN
F 3 "" H 8850 2700 50  0000 C CNN
	1    8850 2700
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q13
U 1 1 58588B8A
P 7800 3750
AR Path="/58586AAB/58588B8A" Ref="Q13"  Part="1" 
AR Path="/58595F89/58588B8A" Ref="Q29"  Part="1" 
AR Path="/58596163/58588B8A" Ref="Q45"  Part="1" 
F 0 "Q45" H 8000 3825 50  0000 L CNN
F 1 "BS170" H 8000 3750 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 3675 50  0000 L CIN
F 3 "" H 7800 3750 50  0000 L CNN
	1    7800 3750
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q14
U 1 1 58588B90
P 7800 4150
AR Path="/58586AAB/58588B90" Ref="Q14"  Part="1" 
AR Path="/58595F89/58588B90" Ref="Q30"  Part="1" 
AR Path="/58596163/58588B90" Ref="Q46"  Part="1" 
F 0 "Q46" H 8000 4225 50  0000 L CNN
F 1 "BS170" H 8000 4150 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 4075 50  0000 L CIN
F 3 "" H 7800 4150 50  0000 L CNN
	1    7800 4150
	1    0    0    1   
$EndComp
$Comp
L D_Small D13
U 1 1 58588B96
P 8250 3450
AR Path="/58586AAB/58588B96" Ref="D13"  Part="1" 
AR Path="/58595F89/58588B96" Ref="D29"  Part="1" 
AR Path="/58596163/58588B96" Ref="D45"  Part="1" 
F 0 "D45" H 8400 3500 50  0000 L CNN
F 1 "1N4001" H 8100 3370 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 3450 50  0001 C CNN
F 3 "" V 8250 3450 50  0000 C CNN
	1    8250 3450
	-1   0    0    1   
$EndComp
$Comp
L D_Small D14
U 1 1 58588B9C
P 8250 4450
AR Path="/58586AAB/58588B9C" Ref="D14"  Part="1" 
AR Path="/58595F89/58588B9C" Ref="D30"  Part="1" 
AR Path="/58596163/58588B9C" Ref="D46"  Part="1" 
F 0 "D46" H 8400 4450 50  0000 L CNN
F 1 "1N4001" H 8100 4550 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 4450 50  0001 C CNN
F 3 "" V 8250 4450 50  0000 C CNN
	1    8250 4450
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P8
U 1 1 58588BA2
P 8850 3950
AR Path="/58586AAB/58588BA2" Ref="P8"  Part="1" 
AR Path="/58595F89/58588BA2" Ref="P16"  Part="1" 
AR Path="/58596163/58588BA2" Ref="P24"  Part="1" 
F 0 "P24" H 8850 4150 50  0000 C CNN
F 1 "Relay 7" V 8950 3950 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 8850 3950 50  0001 C CNN
F 3 "" H 8850 3950 50  0000 C CNN
	1    8850 3950
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q15
U 1 1 58588D14
P 7800 5000
AR Path="/58586AAB/58588D14" Ref="Q15"  Part="1" 
AR Path="/58595F89/58588D14" Ref="Q31"  Part="1" 
AR Path="/58596163/58588D14" Ref="Q47"  Part="1" 
F 0 "Q47" H 8000 5075 50  0000 L CNN
F 1 "BS170" H 8000 5000 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 4925 50  0000 L CIN
F 3 "" H 7800 5000 50  0000 L CNN
	1    7800 5000
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q16
U 1 1 58588D1A
P 7800 5400
AR Path="/58586AAB/58588D1A" Ref="Q16"  Part="1" 
AR Path="/58595F89/58588D1A" Ref="Q32"  Part="1" 
AR Path="/58596163/58588D1A" Ref="Q48"  Part="1" 
F 0 "Q48" H 8000 5475 50  0000 L CNN
F 1 "BS170" H 8000 5400 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 5325 50  0000 L CIN
F 3 "" H 7800 5400 50  0000 L CNN
	1    7800 5400
	1    0    0    1   
$EndComp
$Comp
L D_Small D15
U 1 1 58588D20
P 8250 4700
AR Path="/58586AAB/58588D20" Ref="D15"  Part="1" 
AR Path="/58595F89/58588D20" Ref="D31"  Part="1" 
AR Path="/58596163/58588D20" Ref="D47"  Part="1" 
F 0 "D47" H 8400 4750 50  0000 L CNN
F 1 "1N4001" H 8100 4620 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 4700 50  0001 C CNN
F 3 "" V 8250 4700 50  0000 C CNN
	1    8250 4700
	-1   0    0    1   
$EndComp
$Comp
L D_Small D16
U 1 1 58588D26
P 8250 5700
AR Path="/58586AAB/58588D26" Ref="D16"  Part="1" 
AR Path="/58595F89/58588D26" Ref="D32"  Part="1" 
AR Path="/58596163/58588D26" Ref="D48"  Part="1" 
F 0 "D48" H 8400 5700 50  0000 L CNN
F 1 "1N4001" H 8100 5800 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 8250 5700 50  0001 C CNN
F 3 "" V 8250 5700 50  0000 C CNN
	1    8250 5700
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P9
U 1 1 58588D2C
P 8850 5200
AR Path="/58586AAB/58588D2C" Ref="P9"  Part="1" 
AR Path="/58595F89/58588D2C" Ref="P17"  Part="1" 
AR Path="/58596163/58588D2C" Ref="P25"  Part="1" 
F 0 "P25" H 8850 5400 50  0000 C CNN
F 1 "Relay 8" V 8950 5200 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 8850 5200 50  0001 C CNN
F 3 "" H 8850 5200 50  0000 C CNN
	1    8850 5200
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q1
U 1 1 58589140
P 5350 1250
AR Path="/58586AAB/58589140" Ref="Q1"  Part="1" 
AR Path="/58595F89/58589140" Ref="Q17"  Part="1" 
AR Path="/58596163/58589140" Ref="Q33"  Part="1" 
F 0 "Q33" H 5550 1325 50  0000 L CNN
F 1 "BS170" H 5550 1250 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 1175 50  0000 L CIN
F 3 "" H 5350 1250 50  0000 L CNN
	1    5350 1250
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q2
U 1 1 58589146
P 5350 1650
AR Path="/58586AAB/58589146" Ref="Q2"  Part="1" 
AR Path="/58595F89/58589146" Ref="Q18"  Part="1" 
AR Path="/58596163/58589146" Ref="Q34"  Part="1" 
F 0 "Q34" H 5550 1725 50  0000 L CNN
F 1 "BS170" H 5550 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 1575 50  0000 L CIN
F 3 "" H 5350 1650 50  0000 L CNN
	1    5350 1650
	1    0    0    1   
$EndComp
$Comp
L D_Small D1
U 1 1 5858914C
P 5800 950
AR Path="/58586AAB/5858914C" Ref="D1"  Part="1" 
AR Path="/58595F89/5858914C" Ref="D17"  Part="1" 
AR Path="/58596163/5858914C" Ref="D33"  Part="1" 
F 0 "D33" H 5950 1000 50  0000 L CNN
F 1 "1N4001" H 5650 870 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 950 50  0001 C CNN
F 3 "" V 5800 950 50  0000 C CNN
	1    5800 950 
	-1   0    0    1   
$EndComp
$Comp
L D_Small D2
U 1 1 58589152
P 5800 1950
AR Path="/58586AAB/58589152" Ref="D2"  Part="1" 
AR Path="/58595F89/58589152" Ref="D18"  Part="1" 
AR Path="/58596163/58589152" Ref="D34"  Part="1" 
F 0 "D34" H 5950 1950 50  0000 L CNN
F 1 "1N4001" H 5650 2050 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 1950 50  0001 C CNN
F 3 "" V 5800 1950 50  0000 C CNN
	1    5800 1950
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P2
U 1 1 58589158
P 6400 1450
AR Path="/58586AAB/58589158" Ref="P2"  Part="1" 
AR Path="/58595F89/58589158" Ref="P10"  Part="1" 
AR Path="/58596163/58589158" Ref="P18"  Part="1" 
F 0 "P18" H 6400 1650 50  0000 C CNN
F 1 "Relay 1" V 6500 1450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 6400 1450 50  0001 C CNN
F 3 "" H 6400 1450 50  0000 C CNN
	1    6400 1450
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q3
U 1 1 5858916F
P 5350 2500
AR Path="/58586AAB/5858916F" Ref="Q3"  Part="1" 
AR Path="/58595F89/5858916F" Ref="Q19"  Part="1" 
AR Path="/58596163/5858916F" Ref="Q35"  Part="1" 
F 0 "Q35" H 5550 2575 50  0000 L CNN
F 1 "BS170" H 5550 2500 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 2425 50  0000 L CIN
F 3 "" H 5350 2500 50  0000 L CNN
	1    5350 2500
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q4
U 1 1 58589175
P 5350 2900
AR Path="/58586AAB/58589175" Ref="Q4"  Part="1" 
AR Path="/58595F89/58589175" Ref="Q20"  Part="1" 
AR Path="/58596163/58589175" Ref="Q36"  Part="1" 
F 0 "Q36" H 5550 2975 50  0000 L CNN
F 1 "BS170" H 5550 2900 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 2825 50  0000 L CIN
F 3 "" H 5350 2900 50  0000 L CNN
	1    5350 2900
	1    0    0    1   
$EndComp
$Comp
L D_Small D3
U 1 1 5858917B
P 5800 2200
AR Path="/58586AAB/5858917B" Ref="D3"  Part="1" 
AR Path="/58595F89/5858917B" Ref="D19"  Part="1" 
AR Path="/58596163/5858917B" Ref="D35"  Part="1" 
F 0 "D35" H 5950 2250 50  0000 L CNN
F 1 "1N4001" H 5650 2120 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 2200 50  0001 C CNN
F 3 "" V 5800 2200 50  0000 C CNN
	1    5800 2200
	-1   0    0    1   
$EndComp
$Comp
L D_Small D4
U 1 1 58589181
P 5800 3200
AR Path="/58586AAB/58589181" Ref="D4"  Part="1" 
AR Path="/58595F89/58589181" Ref="D20"  Part="1" 
AR Path="/58596163/58589181" Ref="D36"  Part="1" 
F 0 "D36" H 5950 3200 50  0000 L CNN
F 1 "1N4001" H 5650 3300 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 3200 50  0001 C CNN
F 3 "" V 5800 3200 50  0000 C CNN
	1    5800 3200
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 58589187
P 6400 2700
AR Path="/58586AAB/58589187" Ref="P3"  Part="1" 
AR Path="/58595F89/58589187" Ref="P11"  Part="1" 
AR Path="/58596163/58589187" Ref="P19"  Part="1" 
F 0 "P19" H 6400 2900 50  0000 C CNN
F 1 "Relay 2" V 6500 2700 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 6400 2700 50  0001 C CNN
F 3 "" H 6400 2700 50  0000 C CNN
	1    6400 2700
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q5
U 1 1 5858919E
P 5350 3750
AR Path="/58586AAB/5858919E" Ref="Q5"  Part="1" 
AR Path="/58595F89/5858919E" Ref="Q21"  Part="1" 
AR Path="/58596163/5858919E" Ref="Q37"  Part="1" 
F 0 "Q37" H 5550 3825 50  0000 L CNN
F 1 "BS170" H 5550 3750 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 3675 50  0000 L CIN
F 3 "" H 5350 3750 50  0000 L CNN
	1    5350 3750
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q6
U 1 1 585891A4
P 5350 4150
AR Path="/58586AAB/585891A4" Ref="Q6"  Part="1" 
AR Path="/58595F89/585891A4" Ref="Q22"  Part="1" 
AR Path="/58596163/585891A4" Ref="Q38"  Part="1" 
F 0 "Q38" H 5550 4225 50  0000 L CNN
F 1 "BS170" H 5550 4150 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 4075 50  0000 L CIN
F 3 "" H 5350 4150 50  0000 L CNN
	1    5350 4150
	1    0    0    1   
$EndComp
$Comp
L D_Small D5
U 1 1 585891AA
P 5800 3450
AR Path="/58586AAB/585891AA" Ref="D5"  Part="1" 
AR Path="/58595F89/585891AA" Ref="D21"  Part="1" 
AR Path="/58596163/585891AA" Ref="D37"  Part="1" 
F 0 "D37" H 5950 3500 50  0000 L CNN
F 1 "1N4001" H 5650 3370 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 3450 50  0001 C CNN
F 3 "" V 5800 3450 50  0000 C CNN
	1    5800 3450
	-1   0    0    1   
$EndComp
$Comp
L D_Small D6
U 1 1 585891B0
P 5800 4450
AR Path="/58586AAB/585891B0" Ref="D6"  Part="1" 
AR Path="/58595F89/585891B0" Ref="D22"  Part="1" 
AR Path="/58596163/585891B0" Ref="D38"  Part="1" 
F 0 "D38" H 5950 4450 50  0000 L CNN
F 1 "1N4001" H 5650 4550 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 4450 50  0001 C CNN
F 3 "" V 5800 4450 50  0000 C CNN
	1    5800 4450
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P4
U 1 1 585891B6
P 6400 3950
AR Path="/58586AAB/585891B6" Ref="P4"  Part="1" 
AR Path="/58595F89/585891B6" Ref="P12"  Part="1" 
AR Path="/58596163/585891B6" Ref="P20"  Part="1" 
F 0 "P20" H 6400 4150 50  0000 C CNN
F 1 "Relay 3" V 6500 3950 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 6400 3950 50  0001 C CNN
F 3 "" H 6400 3950 50  0000 C CNN
	1    6400 3950
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q7
U 1 1 585891CD
P 5350 5000
AR Path="/58586AAB/585891CD" Ref="Q7"  Part="1" 
AR Path="/58595F89/585891CD" Ref="Q23"  Part="1" 
AR Path="/58596163/585891CD" Ref="Q39"  Part="1" 
F 0 "Q39" H 5550 5075 50  0000 L CNN
F 1 "BS170" H 5550 5000 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 4925 50  0000 L CIN
F 3 "" H 5350 5000 50  0000 L CNN
	1    5350 5000
	1    0    0    -1  
$EndComp
$Comp
L BS170 Q8
U 1 1 585891D3
P 5350 5400
AR Path="/58586AAB/585891D3" Ref="Q8"  Part="1" 
AR Path="/58595F89/585891D3" Ref="Q24"  Part="1" 
AR Path="/58596163/585891D3" Ref="Q40"  Part="1" 
F 0 "Q40" H 5550 5475 50  0000 L CNN
F 1 "BS170" H 5550 5400 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5550 5325 50  0000 L CIN
F 3 "" H 5350 5400 50  0000 L CNN
	1    5350 5400
	1    0    0    1   
$EndComp
$Comp
L D_Small D7
U 1 1 585891D9
P 5800 4700
AR Path="/58586AAB/585891D9" Ref="D7"  Part="1" 
AR Path="/58595F89/585891D9" Ref="D23"  Part="1" 
AR Path="/58596163/585891D9" Ref="D39"  Part="1" 
F 0 "D39" H 5950 4750 50  0000 L CNN
F 1 "1N4001" H 5650 4620 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 4700 50  0001 C CNN
F 3 "" V 5800 4700 50  0000 C CNN
	1    5800 4700
	-1   0    0    1   
$EndComp
$Comp
L D_Small D8
U 1 1 585891DF
P 5800 5700
AR Path="/58586AAB/585891DF" Ref="D8"  Part="1" 
AR Path="/58595F89/585891DF" Ref="D24"  Part="1" 
AR Path="/58596163/585891DF" Ref="D40"  Part="1" 
F 0 "D40" H 5950 5700 50  0000 L CNN
F 1 "1N4001" H 5650 5800 50  0000 L CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" V 5800 5700 50  0001 C CNN
F 3 "" V 5800 5700 50  0000 C CNN
	1    5800 5700
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P5
U 1 1 585891E5
P 6400 5200
AR Path="/58586AAB/585891E5" Ref="P5"  Part="1" 
AR Path="/58595F89/585891E5" Ref="P13"  Part="1" 
AR Path="/58596163/585891E5" Ref="P21"  Part="1" 
F 0 "P21" H 6400 5400 50  0000 C CNN
F 1 "Relay 4" V 6500 5200 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_3pol" H 6400 5200 50  0001 C CNN
F 3 "" H 6400 5200 50  0000 C CNN
	1    6400 5200
	1    0    0    -1  
$EndComp
Entry Wire Line
	3350 1900 3450 2000
Entry Wire Line
	3350 2000 3450 2100
Entry Wire Line
	3350 2100 3450 2200
Entry Wire Line
	3350 2200 3450 2300
Entry Wire Line
	3350 2300 3450 2400
Entry Wire Line
	3350 2400 3450 2500
Entry Wire Line
	3350 2500 3450 2600
Entry Wire Line
	3350 2600 3450 2700
Text Label 2600 2600 0    60   ~ 0
Relay-1-Open
Text Label 2600 2500 0    60   ~ 0
Relay-1-Closed
Text Label 2600 2400 0    60   ~ 0
Relay-2-Open
Text Label 2600 2300 0    60   ~ 0
Relay-2-Closed
Text Label 2600 2200 0    60   ~ 0
Relay-3-Open
Text Label 2600 2100 0    60   ~ 0
Relay-3-Closed
Text Label 2600 2000 0    60   ~ 0
Relay-4-Open
Text Label 2600 1900 0    60   ~ 0
Relay-4-Closed
Entry Wire Line
	3350 2800 3450 2900
Entry Wire Line
	3350 2900 3450 3000
Entry Wire Line
	3350 3000 3450 3100
Entry Wire Line
	3350 3100 3450 3200
Entry Wire Line
	3350 3200 3450 3300
Entry Wire Line
	3350 3300 3450 3400
Entry Wire Line
	3350 3400 3450 3500
Entry Wire Line
	3350 3500 3450 3600
Text Label 2600 3500 0    60   ~ 0
Relay-5-Open
Text Label 2600 3400 0    60   ~ 0
Relay-5-Closed
Text Label 2600 3300 0    60   ~ 0
Relay-6-Open
Text Label 2600 3200 0    60   ~ 0
Relay-6-Closed
Text Label 2600 3100 0    60   ~ 0
Relay-7-Open
Text Label 2600 3000 0    60   ~ 0
Relay-7-Closed
Text Label 2600 2900 0    60   ~ 0
Relay-8-Open
Text Label 2600 2800 0    60   ~ 0
Relay-8-Closed
Wire Wire Line
	7900 1050 8650 1050
Wire Wire Line
	8650 1050 8650 1350
Wire Wire Line
	8650 1450 7900 1450
Wire Wire Line
	7900 1850 8650 1850
Wire Wire Line
	8650 1850 8650 1550
Wire Wire Line
	8150 950  8150 1050
Connection ~ 8150 1050
Wire Wire Line
	8350 950  8350 1050
Connection ~ 8350 1050
Wire Wire Line
	8150 1850 8150 1950
Connection ~ 8150 1850
Wire Wire Line
	8350 1850 8350 1950
Connection ~ 8350 1850
Wire Wire Line
	7900 2300 8650 2300
Wire Wire Line
	8650 2300 8650 2600
Wire Wire Line
	8650 2700 7900 2700
Wire Wire Line
	7900 3100 8650 3100
Wire Wire Line
	8650 3100 8650 2800
Wire Wire Line
	8150 2200 8150 2300
Connection ~ 8150 2300
Wire Wire Line
	8350 2200 8350 2300
Connection ~ 8350 2300
Wire Wire Line
	8150 3100 8150 3200
Connection ~ 8150 3100
Wire Wire Line
	8350 3100 8350 3200
Connection ~ 8350 3100
Wire Wire Line
	7900 3550 8650 3550
Wire Wire Line
	8650 3550 8650 3850
Wire Wire Line
	8650 3950 7900 3950
Wire Wire Line
	7900 4350 8650 4350
Wire Wire Line
	8650 4350 8650 4050
Wire Wire Line
	8150 3450 8150 3550
Connection ~ 8150 3550
Wire Wire Line
	8350 3450 8350 3550
Connection ~ 8350 3550
Wire Wire Line
	8150 4350 8150 4450
Connection ~ 8150 4350
Wire Wire Line
	8350 4350 8350 4450
Connection ~ 8350 4350
Wire Wire Line
	7900 4800 8650 4800
Wire Wire Line
	8650 4800 8650 5100
Wire Wire Line
	8650 5200 7900 5200
Wire Wire Line
	7900 5600 8650 5600
Wire Wire Line
	8650 5600 8650 5300
Wire Wire Line
	8150 4700 8150 4800
Connection ~ 8150 4800
Wire Wire Line
	8350 4700 8350 4800
Connection ~ 8350 4800
Wire Wire Line
	8150 5600 8150 5700
Connection ~ 8150 5600
Wire Wire Line
	8350 5600 8350 5700
Connection ~ 8350 5600
Wire Wire Line
	5450 1050 6200 1050
Wire Wire Line
	6200 1050 6200 1350
Wire Wire Line
	6200 1450 5450 1450
Wire Wire Line
	5450 1850 6200 1850
Wire Wire Line
	6200 1850 6200 1550
Wire Wire Line
	5700 950  5700 1050
Connection ~ 5700 1050
Wire Wire Line
	5900 950  5900 1050
Connection ~ 5900 1050
Wire Wire Line
	5700 1850 5700 1950
Connection ~ 5700 1850
Wire Wire Line
	5900 1850 5900 1950
Connection ~ 5900 1850
Wire Wire Line
	5450 2300 6200 2300
Wire Wire Line
	6200 2300 6200 2600
Wire Wire Line
	6200 2700 5450 2700
Wire Wire Line
	5450 3100 6200 3100
Wire Wire Line
	6200 3100 6200 2800
Wire Wire Line
	5700 2200 5700 2300
Connection ~ 5700 2300
Wire Wire Line
	5900 2200 5900 2300
Connection ~ 5900 2300
Wire Wire Line
	5700 3100 5700 3200
Connection ~ 5700 3100
Wire Wire Line
	5900 3100 5900 3200
Connection ~ 5900 3100
Wire Wire Line
	5450 3550 6200 3550
Wire Wire Line
	6200 3550 6200 3850
Wire Wire Line
	6200 3950 5450 3950
Wire Wire Line
	5450 4350 6200 4350
Wire Wire Line
	6200 4350 6200 4050
Wire Wire Line
	5700 3450 5700 3550
Connection ~ 5700 3550
Wire Wire Line
	5900 3450 5900 3550
Connection ~ 5900 3550
Wire Wire Line
	5700 4350 5700 4450
Connection ~ 5700 4350
Wire Wire Line
	5900 4350 5900 4450
Connection ~ 5900 4350
Wire Wire Line
	5450 4800 6200 4800
Wire Wire Line
	6200 4800 6200 5100
Wire Wire Line
	6200 5200 5450 5200
Wire Wire Line
	5450 5600 6200 5600
Wire Wire Line
	6200 5600 6200 5300
Wire Wire Line
	5700 4700 5700 4800
Connection ~ 5700 4800
Wire Wire Line
	5900 4700 5900 4800
Connection ~ 5900 4800
Wire Wire Line
	5700 5600 5700 5700
Connection ~ 5700 5600
Wire Wire Line
	5900 5600 5900 5700
Connection ~ 5900 5600
Wire Bus Line
	3450 1300 3450 3600
Wire Bus Line
	3450 1300 4300 1300
Wire Bus Line
	4300 1300 4300 5350
Wire Wire Line
	2550 1900 3350 1900
Wire Wire Line
	3350 2000 2550 2000
Wire Wire Line
	3350 2100 2550 2100
Wire Wire Line
	3350 2200 2550 2200
Wire Wire Line
	3350 2300 2550 2300
Wire Wire Line
	3350 2400 2550 2400
Wire Wire Line
	3350 2600 2550 2600
Wire Wire Line
	2550 2800 3350 2800
Wire Wire Line
	2550 2900 3350 2900
Wire Wire Line
	3350 3000 2550 3000
Wire Wire Line
	2550 3100 3350 3100
Wire Wire Line
	3350 3200 2550 3200
Wire Wire Line
	2550 3300 3350 3300
Wire Wire Line
	3350 3400 2550 3400
Wire Wire Line
	2550 3500 3350 3500
Entry Wire Line
	4300 1400 4400 1300
Entry Wire Line
	4300 1700 4400 1600
Entry Wire Line
	4300 2650 4400 2550
Entry Wire Line
	4300 2950 4400 2850
Entry Wire Line
	4300 3900 4400 3800
Entry Wire Line
	4300 4200 4400 4100
Wire Bus Line
	4300 5300 4300 6050
Wire Bus Line
	4300 6050 6750 6050
Entry Wire Line
	4300 5150 4400 5050
Entry Wire Line
	4300 5450 4400 5350
Wire Wire Line
	5150 1300 4400 1300
Text Label 4450 1300 0    60   ~ 0
Relay-1-Open
Text Label 4450 1600 0    60   ~ 0
Relay-1-Closed
Wire Wire Line
	5150 2550 4400 2550
Wire Wire Line
	5150 2850 4400 2850
Wire Wire Line
	5150 3800 4400 3800
Wire Wire Line
	5150 4100 4400 4100
Wire Wire Line
	5150 5050 4400 5050
Wire Wire Line
	5150 5350 4400 5350
Wire Bus Line
	6750 6050 6750 1300
Entry Wire Line
	6750 1400 6850 1300
Entry Wire Line
	6750 1700 6850 1600
Entry Wire Line
	6750 2650 6850 2550
Entry Wire Line
	6750 2950 6850 2850
Entry Wire Line
	6750 3900 6850 3800
Entry Wire Line
	6750 4200 6850 4100
Entry Wire Line
	6750 5150 6850 5050
Entry Wire Line
	6750 5450 6850 5350
Wire Wire Line
	6850 1300 7600 1300
Wire Wire Line
	7600 1600 6850 1600
Wire Wire Line
	6850 2550 7600 2550
Wire Wire Line
	6850 2850 7600 2850
Wire Wire Line
	7600 3800 6850 3800
Wire Wire Line
	7600 4100 6850 4100
Wire Wire Line
	7600 5050 6850 5050
Wire Wire Line
	7600 5350 6850 5350
Text Label 4450 2550 0    60   ~ 0
Relay-2-Open
Text Label 4450 2850 0    60   ~ 0
Relay-2-Closed
Text Label 4450 3800 0    60   ~ 0
Relay-3-Open
Text Label 4450 4100 0    60   ~ 0
Relay-3-Closed
Text Label 4450 5050 0    60   ~ 0
Relay-4-Open
Text Label 4450 5350 0    60   ~ 0
Relay-4-Closed
Text Label 6900 5350 0    60   ~ 0
Relay-8-Closed
Text Label 6900 5050 0    60   ~ 0
Relay-8-Open
Text Label 6900 4100 0    60   ~ 0
Relay-7-Closed
Text Label 6900 3800 0    60   ~ 0
Relay-7-Open
Text Label 6900 2850 0    60   ~ 0
Relay-6-Closed
Text Label 6900 2550 0    60   ~ 0
Relay-6-Open
Text Label 6900 1600 0    60   ~ 0
Relay-5-Closed
Text Label 6900 1300 0    60   ~ 0
Relay-5-Open
$Comp
L +5V #PWR06
U 1 1 58594D54
P 2050 1450
AR Path="/58586AAB/58594D54" Ref="#PWR06"  Part="1" 
AR Path="/58595F89/58594D54" Ref="#PWR016"  Part="1" 
AR Path="/58596163/58594D54" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 2050 1300 50  0001 C CNN
F 1 "+5V" H 2050 1590 50  0000 C CNN
F 2 "" H 2050 1450 50  0000 C CNN
F 3 "" H 2050 1450 50  0000 C CNN
	1    2050 1450
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR07
U 1 1 58594EDB
P 1900 3950
AR Path="/58586AAB/58594EDB" Ref="#PWR07"  Part="1" 
AR Path="/58595F89/58594EDB" Ref="#PWR017"  Part="1" 
AR Path="/58596163/58594EDB" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 1900 3700 50  0001 C CNN
F 1 "GNDREF" H 1900 3800 50  0000 C CNN
F 2 "" H 1900 3950 50  0000 C CNN
F 3 "" H 1900 3950 50  0000 C CNN
	1    1900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3800 1900 3950
NoConn ~ 1300 2950
NoConn ~ 1300 3050
NoConn ~ 1300 3150
Text HLabel 850  2650 0    60   Input ~ 0
SCL
Text HLabel 850  2750 0    60   Input ~ 0
SDA
Text HLabel 850  2450 0    60   Input ~ 0
A0
Text HLabel 850  2350 0    60   Input ~ 0
A1
Text HLabel 850  2250 0    60   Input ~ 0
A2
Wire Wire Line
	1300 2650 850  2650
Wire Wire Line
	1300 2750 850  2750
Wire Wire Line
	2050 1450 2050 1600
Wire Wire Line
	3350 2500 2550 2500
Wire Wire Line
	5150 1600 4400 1600
$Comp
L GNDREF #PWR018
U 1 1 5859FA4E
P 5850 1450
AR Path="/58595F89/5859FA4E" Ref="#PWR018"  Part="1" 
AR Path="/58586AAB/5859FA4E" Ref="#PWR08"  Part="1" 
AR Path="/58596163/5859FA4E" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 5850 1200 50  0001 C CNN
F 1 "GNDREF" H 5850 1300 50  0000 C CNN
F 2 "" H 5850 1450 50  0000 C CNN
F 3 "" H 5850 1450 50  0000 C CNN
	1    5850 1450
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR019
U 1 1 5859FB81
P 5850 2700
AR Path="/58595F89/5859FB81" Ref="#PWR019"  Part="1" 
AR Path="/58586AAB/5859FB81" Ref="#PWR09"  Part="1" 
AR Path="/58596163/5859FB81" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 5850 2450 50  0001 C CNN
F 1 "GNDREF" H 5850 2550 50  0000 C CNN
F 2 "" H 5850 2700 50  0000 C CNN
F 3 "" H 5850 2700 50  0000 C CNN
	1    5850 2700
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR020
U 1 1 5859FC10
P 8300 1450
AR Path="/58595F89/5859FC10" Ref="#PWR020"  Part="1" 
AR Path="/58586AAB/5859FC10" Ref="#PWR010"  Part="1" 
AR Path="/58596163/5859FC10" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 8300 1200 50  0001 C CNN
F 1 "GNDREF" H 8300 1300 50  0000 C CNN
F 2 "" H 8300 1450 50  0000 C CNN
F 3 "" H 8300 1450 50  0000 C CNN
	1    8300 1450
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR021
U 1 1 5859FC9F
P 8300 2700
AR Path="/58595F89/5859FC9F" Ref="#PWR021"  Part="1" 
AR Path="/58586AAB/5859FC9F" Ref="#PWR011"  Part="1" 
AR Path="/58596163/5859FC9F" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 8300 2450 50  0001 C CNN
F 1 "GNDREF" H 8300 2550 50  0000 C CNN
F 2 "" H 8300 2700 50  0000 C CNN
F 3 "" H 8300 2700 50  0000 C CNN
	1    8300 2700
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR022
U 1 1 5859FDFB
P 5850 3950
AR Path="/58595F89/5859FDFB" Ref="#PWR022"  Part="1" 
AR Path="/58586AAB/5859FDFB" Ref="#PWR012"  Part="1" 
AR Path="/58596163/5859FDFB" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 5850 3700 50  0001 C CNN
F 1 "GNDREF" H 5850 3800 50  0000 C CNN
F 2 "" H 5850 3950 50  0000 C CNN
F 3 "" H 5850 3950 50  0000 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR023
U 1 1 5859FE8A
P 8300 3950
AR Path="/58595F89/5859FE8A" Ref="#PWR023"  Part="1" 
AR Path="/58586AAB/5859FE8A" Ref="#PWR013"  Part="1" 
AR Path="/58596163/5859FE8A" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 8300 3700 50  0001 C CNN
F 1 "GNDREF" H 8300 3800 50  0000 C CNN
F 2 "" H 8300 3950 50  0000 C CNN
F 3 "" H 8300 3950 50  0000 C CNN
	1    8300 3950
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR024
U 1 1 5859FF19
P 5800 5200
AR Path="/58595F89/5859FF19" Ref="#PWR024"  Part="1" 
AR Path="/58586AAB/5859FF19" Ref="#PWR014"  Part="1" 
AR Path="/58596163/5859FF19" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 5800 4950 50  0001 C CNN
F 1 "GNDREF" H 5800 5050 50  0000 C CNN
F 2 "" H 5800 5200 50  0000 C CNN
F 3 "" H 5800 5200 50  0000 C CNN
	1    5800 5200
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR025
U 1 1 5859FFA8
P 8300 5200
AR Path="/58595F89/5859FFA8" Ref="#PWR025"  Part="1" 
AR Path="/58586AAB/5859FFA8" Ref="#PWR015"  Part="1" 
AR Path="/58596163/5859FFA8" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 8300 4950 50  0001 C CNN
F 1 "GNDREF" H 8300 5050 50  0000 C CNN
F 2 "" H 8300 5200 50  0000 C CNN
F 3 "" H 8300 5200 50  0000 C CNN
	1    8300 5200
	1    0    0    -1  
$EndComp
Connection ~ 8300 5200
Connection ~ 5800 5200
Connection ~ 5850 3950
Connection ~ 8300 3950
Connection ~ 8300 2700
Connection ~ 5850 2700
Connection ~ 8300 1450
Connection ~ 5850 1450
Wire Wire Line
	1300 2250 850  2250
Wire Wire Line
	1300 2350 850  2350
Wire Wire Line
	850  2450 1300 2450
$EndSCHEMATC
