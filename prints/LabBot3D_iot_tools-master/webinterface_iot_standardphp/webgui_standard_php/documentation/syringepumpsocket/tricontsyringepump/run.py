import serial
import time, sys,re

ser = serial.Serial('/dev/ttyUSB0',9600)
time.sleep(2)
#ser.write('/1OR\r')

dir = sys.argv[1]

if re.match('D', dir):
	wash = '/1Ov154V240D500BR\r' #dispense
if re.match('A', dir):
	wash = '/1Ov900V1400P500BR\r' #aspirate

#time.sleep(2)

#wash = '/1Ov900V1400D480A1gv900V1400A1gv900V1400IA960v154V240OD960G1BR\r'

#W10_20_40
'''
wash = '/1O'
wash = wash + 'v900V1400D500'
wash = wash + 'A1gv900V1400A1gv900V1400IA240v154V240OD240G1BR\r'
'''

#wash = '/1A1gv900V1400A1gv900V1400IA240v154V240OD240G1R\r'

ser.write(wash)

print wash
time.sleep(3)

