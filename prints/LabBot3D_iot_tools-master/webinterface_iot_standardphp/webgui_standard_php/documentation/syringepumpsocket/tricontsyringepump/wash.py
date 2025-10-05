import serial

ser = serial.Serial('/dev/ttyUSB0',9600)

#/1A1gv900V1400IA3000v77V120D3000G1RA1gv900V1400IA0.2OD0.2G1R

# ------------Wash loop -------------------
washtime = 30 /2.5
steprate = 120
steps = washtime * steprate	
cycles = steps / 3000.
loopcycles = int(cycles)
cmd = '/1A1gv900V1400'
if cycles > 1:
	cmd = cmd + 'IA3000v77V120D3000G'+str(loopcycles)
reststeps = int((cycles - loopcycles) * 3000)

cmd = cmd + 'A1gv900V1400IA'+str(reststeps)+'v77V120OD'+str(reststeps)+'G1R\r'
print cmd
ser.write(cmd)
ser.readline()


