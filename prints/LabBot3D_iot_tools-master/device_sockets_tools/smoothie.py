import serial

ser = serial.Serial('/dev/ttyACM1', 115200, timeout=1)

print ser.readline()
print ser.readline()

print ser.write('M400\r\n')
print ser.readline()

