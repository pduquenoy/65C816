EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "65816 Homebrew Computer"
Date "2021-07-20"
Rev "A"
Comp ""
Comment1 ""
Comment2 "https://github.com/adrienkohlbecker/65816"
Comment3 "Licensed under CERN-OHL-W v2"
Comment4 "Copyright © 2021 Adrien Kohlbecker"
$EndDescr
$Comp
L power:VCC #PWR03
U 1 1 615CFDF6
P 1750 1000
F 0 "#PWR03" H 1750 850 50  0001 C CNN
F 1 "VCC" H 1765 1173 50  0000 C CNN
F 2 "" H 1750 1000 50  0001 C CNN
F 3 "" H 1750 1000 50  0001 C CNN
	1    1750 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 615D083F
P 1750 1300
F 0 "#PWR04" H 1750 1050 50  0001 C CNN
F 1 "GND" H 1755 1127 50  0000 C CNN
F 2 "" H 1750 1300 50  0001 C CNN
F 3 "" H 1750 1300 50  0001 C CNN
	1    1750 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 615D1014
P 750 1200
F 0 "J1" H 668 875 50  0000 C CNN
F 1 "POWER" H 668 966 50  0000 C CNN
F 2 "" H 750 1200 50  0001 C CNN
F 3 "~" H 750 1200 50  0001 C CNN
	1    750  1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 1200 950  1200
$Comp
L Device:CP C1
U 1 1 615D406F
P 1350 1150
F 0 "C1" H 1468 1196 50  0000 L CNN
F 1 "220uF" H 1468 1105 50  0000 L CNN
F 2 "" H 1388 1000 50  0001 C CNN
F 3 "~" H 1350 1150 50  0001 C CNN
	1    1350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1100 1150 1100
Wire Wire Line
	1150 1100 1150 1000
Wire Wire Line
	1150 1000 1350 1000
Wire Wire Line
	1350 1000 1750 1000
Connection ~ 1350 1000
Wire Wire Line
	1750 1300 1350 1300
Wire Wire Line
	1150 1300 1150 1200
Connection ~ 1350 1300
Wire Wire Line
	1350 1300 1150 1300
$Comp
L Device:CP C2
U 1 1 615D6B6C
P 2700 1000
F 0 "C2" H 2818 1046 50  0000 L CNN
F 1 "10uF" H 2818 955 50  0000 L CNN
F 2 "" H 2738 850 50  0001 C CNN
F 3 "~" H 2700 1000 50  0001 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 615D71A6
P 3200 1000
F 0 "C3" H 3318 1046 50  0000 L CNN
F 1 "10uF" H 3318 955 50  0000 L CNN
F 2 "" H 3238 850 50  0001 C CNN
F 3 "~" H 3200 1000 50  0001 C CNN
	1    3200 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 615D756A
P 2950 850
F 0 "#PWR07" H 2950 700 50  0001 C CNN
F 1 "VCC" H 2965 1023 50  0000 C CNN
F 2 "" H 2950 850 50  0001 C CNN
F 3 "" H 2950 850 50  0001 C CNN
	1    2950 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 615D7C09
P 2950 1150
F 0 "#PWR08" H 2950 900 50  0001 C CNN
F 1 "GND" H 2955 977 50  0000 C CNN
F 2 "" H 2950 1150 50  0001 C CNN
F 3 "" H 2950 1150 50  0001 C CNN
	1    2950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 850  2950 850 
Connection ~ 2950 850 
Wire Wire Line
	2950 850  2700 850 
Wire Wire Line
	2700 1150 2950 1150
Connection ~ 2950 1150
Wire Wire Line
	2950 1150 3200 1150
Text Notes 3100 800  0    50   ~ 0
Breadboard power rail decoupling\nNot in the final PCB
$Comp
L power:VCC #PWR09
U 1 1 615D888F
P 3100 2000
F 0 "#PWR09" H 3100 1850 50  0001 C CNN
F 1 "VCC" H 3115 2173 50  0000 C CNN
F 2 "" H 3100 2000 50  0001 C CNN
F 3 "" H 3100 2000 50  0001 C CNN
	1    3100 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 615DA8BF
P 4600 1000
F 0 "C4" H 4715 1046 50  0000 L CNN
F 1 "100nF" H 4715 955 50  0000 L CNN
F 2 "" H 4638 850 50  0001 C CNN
F 3 "~" H 4600 1000 50  0001 C CNN
	1    4600 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 615DAD1B
P 4600 850
F 0 "#PWR011" H 4600 700 50  0001 C CNN
F 1 "VCC" H 4615 1023 50  0000 C CNN
F 2 "" H 4600 850 50  0001 C CNN
F 3 "" H 4600 850 50  0001 C CNN
	1    4600 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 615DB156
P 4600 1150
F 0 "#PWR012" H 4600 900 50  0001 C CNN
F 1 "GND" H 4605 977 50  0000 C CNN
F 2 "" H 4600 1150 50  0001 C CNN
F 3 "" H 4600 1150 50  0001 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
Text Notes 4700 750  0    50   ~ 0
Decoupling capacitor one per chip, place next to power pin
$Comp
L Device:LED D1
U 1 1 615DBF9C
P 2150 1250
F 0 "D1" V 2189 1132 50  0000 R CNN
F 1 "POWER" V 2098 1132 50  0000 R CNN
F 2 "" H 2150 1250 50  0001 C CNN
F 3 "~" H 2150 1250 50  0001 C CNN
	1    2150 1250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 615DC6A0
P 2150 950
F 0 "R1" H 2080 904 50  0000 R CNN
F 1 "220" H 2080 995 50  0000 R CNN
F 2 "" V 2080 950 50  0001 C CNN
F 3 "~" H 2150 950 50  0001 C CNN
	1    2150 950 
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 615DCFD2
P 2150 800
F 0 "#PWR05" H 2150 650 50  0001 C CNN
F 1 "VCC" H 2165 973 50  0000 C CNN
F 2 "" H 2150 800 50  0001 C CNN
F 3 "" H 2150 800 50  0001 C CNN
	1    2150 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 615DD5B7
P 2150 1400
F 0 "#PWR06" H 2150 1150 50  0001 C CNN
F 1 "GND" H 2155 1227 50  0000 C CNN
F 2 "" H 2150 1400 50  0001 C CNN
F 3 "" H 2150 1400 50  0001 C CNN
	1    2150 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 615E5C10
P 3100 5100
F 0 "#PWR010" H 3100 4850 50  0001 C CNN
F 1 "GND" H 3105 4927 50  0000 C CNN
F 2 "" H 3100 5100 50  0001 C CNN
F 3 "" H 3100 5100 50  0001 C CNN
	1    3100 5100
	1    0    0    -1  
$EndComp
Text GLabel 1200 2300 0    50   Input ~ 0
CLK
Text GLabel 1800 2300 2    50   Output ~ 0
~CLK
Entry Wire Line
	3850 4050 3950 4150
Entry Wire Line
	3850 4150 3950 4250
Entry Wire Line
	3850 4250 3950 4350
Entry Wire Line
	3850 4350 3950 4450
Entry Wire Line
	3850 4450 3950 4550
Entry Wire Line
	3850 4550 3950 4650
Entry Wire Line
	3850 4650 3950 4750
Entry Wire Line
	3850 4750 3950 4850
Wire Wire Line
	3850 4050 3700 4050
Wire Wire Line
	3700 4150 3850 4150
Wire Wire Line
	3850 4250 3700 4250
Wire Wire Line
	3700 4350 3850 4350
Wire Wire Line
	3850 4450 3700 4450
Wire Wire Line
	3700 4550 3850 4550
Wire Wire Line
	3850 4650 3700 4650
Wire Wire Line
	3700 4750 3850 4750
Text Label 3700 4050 0    50   ~ 0
DBA0
Text Label 3700 4150 0    50   ~ 0
DBA1
Text Label 3700 4250 0    50   ~ 0
DBA2
Text Label 3700 4350 0    50   ~ 0
DBA3
Text Label 3700 4450 0    50   ~ 0
DBA4
Text Label 3700 4650 0    50   ~ 0
DBA6
Text Label 3700 4750 0    50   ~ 0
DBA7
Text Label 3700 4550 0    50   ~ 0
DBA5
Entry Wire Line
	4300 4100 4400 4000
Entry Wire Line
	4300 4200 4400 4100
Entry Wire Line
	4300 4300 4400 4200
Entry Wire Line
	4300 4400 4400 4300
Entry Wire Line
	4300 4500 4400 4400
Entry Wire Line
	4300 4600 4400 4500
Entry Wire Line
	4300 4700 4400 4600
Entry Wire Line
	4300 4800 4400 4700
Wire Wire Line
	4700 4000 4400 4000
Wire Wire Line
	4400 4100 4700 4100
Wire Wire Line
	4700 4200 4400 4200
Wire Wire Line
	4400 4300 4700 4300
Wire Wire Line
	4700 4400 4400 4400
Wire Wire Line
	4400 4500 4700 4500
Wire Wire Line
	4700 4600 4400 4600
Wire Wire Line
	4400 4700 4700 4700
Text Label 4400 4000 0    50   ~ 0
DBA0
Text Label 4400 4100 0    50   ~ 0
DBA1
Text Label 4400 4200 0    50   ~ 0
DBA2
Text Label 4400 4300 0    50   ~ 0
DBA3
Text Label 4400 4400 0    50   ~ 0
DBA4
Text Label 4400 4600 0    50   ~ 0
DBA6
Text Label 4400 4700 0    50   ~ 0
DBA7
Text Label 4400 4500 0    50   ~ 0
DBA5
Text GLabel 4700 4900 0    50   Input ~ 0
~CLK
$Comp
L power:GND #PWR013
U 1 1 615F69AE
P 4700 5000
F 0 "#PWR013" H 4700 4750 50  0001 C CNN
F 1 "GND" H 4705 4827 50  0000 C CNN
F 2 "" H 4700 5000 50  0001 C CNN
F 3 "" H 4700 5000 50  0001 C CNN
	1    4700 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 615F6CAB
P 5200 5300
F 0 "#PWR015" H 5200 5050 50  0001 C CNN
F 1 "GND" H 5205 5127 50  0000 C CNN
F 2 "" H 5200 5300 50  0001 C CNN
F 3 "" H 5200 5300 50  0001 C CNN
	1    5200 5300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR014
U 1 1 615F735E
P 5200 3700
F 0 "#PWR014" H 5200 3550 50  0001 C CNN
F 1 "VCC" H 5215 3873 50  0000 C CNN
F 2 "" H 5200 3700 50  0001 C CNN
F 3 "" H 5200 3700 50  0001 C CNN
	1    5200 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	5950 4600 5850 4700
Entry Wire Line
	5950 4500 5850 4600
Entry Wire Line
	5950 4400 5850 4500
Entry Wire Line
	5950 4300 5850 4400
Entry Wire Line
	5950 4200 5850 4300
Entry Wire Line
	5950 4100 5850 4200
Entry Wire Line
	5950 4000 5850 4100
Entry Wire Line
	5950 3900 5850 4000
Wire Wire Line
	5850 4000 5700 4000
Wire Wire Line
	5700 4100 5850 4100
Wire Wire Line
	5850 4200 5700 4200
Wire Wire Line
	5700 4300 5850 4300
Wire Wire Line
	5850 4400 5700 4400
Wire Wire Line
	5700 4500 5850 4500
Wire Wire Line
	5850 4600 5700 4600
Wire Wire Line
	5700 4700 5850 4700
Text Label 5700 4000 0    50   ~ 0
BA0
Text Label 5700 4100 0    50   ~ 0
BA1
Text Label 5700 4200 0    50   ~ 0
BA2
Text Label 5700 4300 0    50   ~ 0
BA3
Text Label 5700 4400 0    50   ~ 0
BA4
Text Label 5700 4600 0    50   ~ 0
BA6
Text Label 5700 4700 0    50   ~ 0
BA7
Text Label 5700 4500 0    50   ~ 0
BA5
Entry Wire Line
	3950 2950 3850 3050
Entry Wire Line
	3950 2850 3850 2950
Entry Wire Line
	3950 2750 3850 2850
Entry Wire Line
	3950 2650 3850 2750
Entry Wire Line
	3950 2550 3850 2650
Entry Wire Line
	3950 2450 3850 2550
Entry Wire Line
	3950 2350 3850 2450
Entry Wire Line
	3950 2250 3850 2350
Wire Wire Line
	3850 2350 3700 2350
Wire Wire Line
	3700 2450 3850 2450
Wire Wire Line
	3850 2550 3700 2550
Wire Wire Line
	3700 2650 3850 2650
Wire Wire Line
	3850 2750 3700 2750
Wire Wire Line
	3700 2850 3850 2850
Wire Wire Line
	3850 2950 3700 2950
Wire Wire Line
	3700 3050 3850 3050
Text Label 3700 2350 0    50   ~ 0
A0
Text Label 3700 2450 0    50   ~ 0
A1
Text Label 3700 2550 0    50   ~ 0
A2
Text Label 3700 2650 0    50   ~ 0
A3
Text Label 3700 2750 0    50   ~ 0
A4
Text Label 3700 2950 0    50   ~ 0
A6
Text Label 3700 3050 0    50   ~ 0
A7
Text Label 3700 2850 0    50   ~ 0
A5
Entry Wire Line
	3950 3750 3850 3850
Entry Wire Line
	3950 3650 3850 3750
Entry Wire Line
	3950 3550 3850 3650
Entry Wire Line
	3950 3450 3850 3550
Entry Wire Line
	3950 3350 3850 3450
Entry Wire Line
	3950 3250 3850 3350
Entry Wire Line
	3950 3150 3850 3250
Entry Wire Line
	3950 3050 3850 3150
Wire Wire Line
	3850 3150 3700 3150
Wire Wire Line
	3700 3250 3850 3250
Wire Wire Line
	3850 3350 3700 3350
Wire Wire Line
	3700 3450 3850 3450
Wire Wire Line
	3850 3550 3700 3550
Wire Wire Line
	3700 3650 3850 3650
Wire Wire Line
	3850 3750 3700 3750
Wire Wire Line
	3700 3850 3850 3850
Text Label 3700 3150 0    50   ~ 0
A8
Text Label 3700 3250 0    50   ~ 0
A9
Text Label 3700 3350 0    50   ~ 0
A10
Text Label 3700 3450 0    50   ~ 0
A11
Text Label 3700 3750 0    50   ~ 0
A14
Text Label 3700 3850 0    50   ~ 0
A15
Text Label 3700 3650 0    50   ~ 0
A13
Text Label 3700 3550 0    50   ~ 0
A12
Wire Bus Line
	5950 2250 6250 2250
Connection ~ 5950 2250
Text GLabel 6250 2250 2    50   Output ~ 0
A0..A23
Wire Bus Line
	3950 2250 5950 2250
Wire Bus Line
	3950 4950 4300 4950
$Comp
L AK's_Library:74AC04 U1
U 1 1 6161E14B
P 1500 2300
F 0 "U1" H 1500 2617 50  0000 C CNN
F 1 "74AC04" H 1500 2526 50  0000 C CNN
F 2 "" H 1500 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 1500 2300 50  0001 C CNN
	1    1500 2300
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC573 U3
U 1 1 61607DB1
P 5200 4500
F 0 "U3" H 4950 5150 50  0000 C CNN
F 1 "74AC04" H 5450 5150 50  0000 C CNN
F 2 "" H 5200 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 5200 4500 50  0001 C CNN
	1    5200 4500
	1    0    0    -1  
$EndComp
$Comp
L 65xx:W65C816SxP U2
U 1 1 615CDC2D
P 3100 3550
F 0 "U2" H 2750 4950 50  0000 C CNN
F 1 "74AC04" H 3400 4950 50  0000 C CIB
F 2 "" H 3100 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 3100 5450 50  0001 C CNN
	1    3100 3550
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC04 U1
U 7 1 61620F57
P 1400 3350
F 0 "U1" H 1630 3396 50  0000 L CNN
F 1 "74AC04" H 1630 3305 50  0000 L CNN
F 2 "" H 1400 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 1400 3350 50  0001 C CNN
	7    1400 3350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 61622B7F
P 1400 2850
F 0 "#PWR01" H 1400 2700 50  0001 C CNN
F 1 "VCC" H 1415 3023 50  0000 C CNN
F 2 "" H 1400 2850 50  0001 C CNN
F 3 "" H 1400 2850 50  0001 C CNN
	1    1400 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61623095
P 1400 3850
F 0 "#PWR02" H 1400 3600 50  0001 C CNN
F 1 "GND" H 1405 3677 50  0000 C CNN
F 2 "" H 1400 3850 50  0001 C CNN
F 3 "" H 1400 3850 50  0001 C CNN
	1    1400 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 616234EE
P 5100 1000
F 0 "C5" H 5215 1046 50  0000 L CNN
F 1 "100nF" H 5215 955 50  0000 L CNN
F 2 "" H 5138 850 50  0001 C CNN
F 3 "~" H 5100 1000 50  0001 C CNN
	1    5100 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 6162388A
P 5600 1000
F 0 "C6" H 5715 1046 50  0000 L CNN
F 1 "100nF" H 5715 955 50  0000 L CNN
F 2 "" H 5638 850 50  0001 C CNN
F 3 "~" H 5600 1000 50  0001 C CNN
	1    5600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 850  5100 850 
Connection ~ 4600 850 
Connection ~ 5100 850 
Wire Wire Line
	5100 850  4600 850 
Wire Wire Line
	4600 1150 5100 1150
Connection ~ 4600 1150
Connection ~ 5100 1150
Wire Wire Line
	5100 1150 5600 1150
$Comp
L AK's_Library:74AC04 U1
U 2 1 616275C1
P 8000 1300
F 0 "U1" H 8000 1617 50  0000 C CNN
F 1 "74AC04" H 8000 1526 50  0000 C CNN
F 2 "" H 8000 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 8000 1300 50  0001 C CNN
	2    8000 1300
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC04 U1
U 3 1 61628A5E
P 8000 1850
F 0 "U1" H 8000 2167 50  0000 C CNN
F 1 "74AC04" H 8000 2076 50  0000 C CNN
F 2 "" H 8000 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 8000 1850 50  0001 C CNN
	3    8000 1850
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC04 U1
U 4 1 61629B31
P 8000 2400
F 0 "U1" H 8000 2717 50  0000 C CNN
F 1 "74AC04" H 8000 2626 50  0000 C CNN
F 2 "" H 8000 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 8000 2400 50  0001 C CNN
	4    8000 2400
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC04 U1
U 5 1 6162A4ED
P 8800 1300
F 0 "U1" H 8800 1617 50  0000 C CNN
F 1 "74AC04" H 8800 1526 50  0000 C CNN
F 2 "" H 8800 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 8800 1300 50  0001 C CNN
	5    8800 1300
	1    0    0    -1  
$EndComp
$Comp
L AK's_Library:74AC04 U1
U 6 1 6162CB28
P 8800 1850
F 0 "U1" H 8800 2167 50  0000 C CNN
F 1 "74AC04" H 8800 2076 50  0000 C CNN
F 2 "" H 8800 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC04" H 8800 1850 50  0001 C CNN
	6    8800 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2400 7700 1850
Wire Wire Line
	7700 850  8150 850 
Wire Wire Line
	8500 850  8500 1300
Connection ~ 7700 1300
Wire Wire Line
	7700 1300 7700 850 
Connection ~ 7700 1850
Wire Wire Line
	7700 1850 7700 1300
Connection ~ 8500 1300
Wire Wire Line
	8500 1300 8500 1850
$Comp
L power:VCC #PWR016
U 1 1 61636624
P 8150 850
F 0 "#PWR016" H 8150 700 50  0001 C CNN
F 1 "VCC" H 8165 1023 50  0000 C CNN
F 2 "" H 8150 850 50  0001 C CNN
F 3 "" H 8150 850 50  0001 C CNN
	1    8150 850 
	1    0    0    -1  
$EndComp
Connection ~ 8150 850 
Wire Wire Line
	8150 850  8500 850 
NoConn ~ 8300 1300
NoConn ~ 8300 1850
NoConn ~ 8300 2400
NoConn ~ 9100 1850
NoConn ~ 9100 1300
Wire Bus Line
	5950 2250 5950 4600
Wire Bus Line
	4300 4100 4300 4950
Wire Bus Line
	3950 4150 3950 4950
Wire Bus Line
	3950 2250 3950 3750
$EndSCHEMATC
