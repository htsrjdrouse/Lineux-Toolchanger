import serial
import re
import time 


def readencoders(serencoder):
 serencoder.write("xyread\n\r")
 ttm = serencoder.readline()
 print ttm
 ttm = re.sub("\r\n", "", ttm)
 x = re.split("_", ttm)[0]
 y = re.sub("y", "", re.split("_", ttm)[1])
 gg = {}
 gg['x'] = x
 gg['y'] = y
 return gg 


def whichone():
 pt = [0,1,2]
 ports = {}
 for i in pt:
  try: 
   sera = serial.Serial('/dev/ttyACM'+str(i), 9600, timeout=0.5)
   sera.write("info\n")
   resp =  sera.readline()
   print resp
   sera.close()
   if re.match("conveyer_linearactuator.*", resp):
    ports['steppers'] = 'ttyACM'+str(i)
   elif re.match("wash_.*", resp):
    ports['microfluidic'] = 'ttyACM'+str(i)
   elif re.match("linearencoder.*", resp):
    ports['softpot'] = 'ttyACM'+str(i)
   elif re.match("Smoothie.*", resp):
    ports['smoothie'] = 'ttyACM'+str(i)
  except:
    pass
 return ports


ports = whichone()
print ports
serencoder = serial.Serial('/dev/'+ports['softpot'], 115200, timeout=0.5)
ttm = readencoders(serencoder)
print ttm

