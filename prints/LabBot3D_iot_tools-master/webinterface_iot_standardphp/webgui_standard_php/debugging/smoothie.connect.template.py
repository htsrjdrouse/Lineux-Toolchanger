import serial

port = 'ttyACM1'

ser = serial.Serial('/dev/'+port,115200)
a= ser.readline()
a = ser.readline()

#ser.write('M550 HTSRepstrap\r\n')
ser.write('M92X80\r\n')
a = ser.readline()
print a
'''
pos = []
ser.write('M114\r\n')
a = ser.readline()
pos.append(a)
print a
ser.write('G1X160F1000\r\n')
a = ser.readline()
#print a
ser.write('M400\r\n')
a = ser.readline()
#print a
ser.write('M114\r\n')
a = ser.readline()
pos.append(a)

ser.write('G1X60F1000\r\n')
a = ser.readline()
#print a
ser.write('M400\r\n')
a = ser.readline()
#print a
ser.write('M114\r\n')
a = ser.readline()
pos.append(a)
print pos



ser.write('config-get alpha_current\r\n')
print ser.readline()

ser.write('config-get beta_current\r\n')
print ser.readline()

ser.write('config-get gamma_current\r\n')
print ser.readline()


ser.write('config-set sd alpha_current 0.5\r\n')
print ser.readline()
ser.write('M500\r\n')
print ser.readline()
ser.write('M501\r\n')

ser.write('config-set sd alpha_current 0.5\r\n')
print ser.readline()
ser.write('M500\r\n')
print ser.readline()
ser.write('reset\r\n')


ser.write('save sd/config\r\n')
print ser.readline()
ser.write('config-get sd alpha_current\r\n')
print ser.readline()

ser.write('config-load dump\r\n')
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
ser.write('config-get alpha_current\r\n')
print ser.readline()

ser.write('config-get alpha_current\r\n')
print ser.readline()
ser.write('config-set sd alpha_current 0.5\r\n')
print ser.readline()
ser.write('M500\r\n')
print ser.readline()
ser.write('M501\r\n')
print ser.readline()
ser.write('config-get alpha_current\r\n')
print ser.readline()
ser.write('save config\r\n')
ser.write('config-get sd alpha_min_endstop\r\n')
print ser.readline()
ser.write('config-set sd alpha_min_endstop 1.24!\r\n')
print ser.readline()
ser.write('config-get sd alpha_min_endstop\r\n')
print ser.readline()

ser.write('config-get sd beta_min_endstop\r\n')
print ser.readline()
ser.write('config-set sd beta_min_endstop 1.26!\r\n')
print ser.readline()
ser.write('config-get sd beta_min_endstop\r\n')
print ser.readline()

ser.write('config-get sd gamma_min_endstop\r\n')
print ser.readline()
ser.write('config-set sd gamma_min_endstop 1.28!\r\n')
print ser.readline()
ser.write('config-get sd gamma_min_endstop\r\n')
print ser.readline()


print ser.readline()
print ser.readline()
alpha_min_endstop
config-get [<configuration_source>] <configuration_setting>

config-set [<configuration_source>] <configuration_setting> <value>

ser.write('M92X100.631Y113.75\r\n')

print ser.readline()
print ser.readline()
ser.write('help\r\n')

print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()
print ser.readline()


print 'Finished with help display'

ser.write('M114\r\n')
print ser.readline()

ser.write('get pos\r\n')

print ser.readline()
'''

