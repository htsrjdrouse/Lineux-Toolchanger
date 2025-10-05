import serial,time

sermicrofluidic = serial.Serial('/dev/ttyACM1', 9600, timeout=0.5)
print sermicrofluidic.readlines()
time.sleep(1)
sermicrofluidic.write("readtemp\n\r")
time.sleep(1)
ss = sermicrofluidic.readline()
print ss
