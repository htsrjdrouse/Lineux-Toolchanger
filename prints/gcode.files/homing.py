import serial,time
ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0.5)
ser.write("G28X0\r\n")
ser.close()
time.sleep(4)
