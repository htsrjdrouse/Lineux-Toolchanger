import serial
import telnetlib
import re
import json
import paho.mqtt.client as mqtt
from subprocess import Popen, PIPE
import time
import operator
import os
import justlicense





def whichone():
 pt = [0,1,2]
 ports = {}
 for i in pt:
  try: 
   sera = serial.Serial('/dev/ttyACM'+str(i), 9600, timeout=0.5)
   sera.write("info\n")
   resp =  sera.readline()
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







def on_connect(client, userdata, flags, rc):
  #print("Connected with result code "+str(rc))
  client.subscribe("labbot3d_1_control")

def gettimeandwritetaskmanager(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  aa['mesg'] = mesg + ' -- ' +tts
  writetaskmanager(aa)
  return tts



def backup_pcvdata():
  pcvdata = justlicense.readnxjson()
  try:
   if pcvdata['smoothielastcommand']:
    os.system('cp nx.imgdataset back.nx.imgdataset')
  except:
    os.system('cp back.nx.imgdataset nx.imgdataset')

def on_message(client, userdata, msg):
  mesg =  msg.payload.decode()
  print "here is the message "+mesg
  #justlicense.gettimeandwritetaskmanager(mesg)
  #justlicense.publisher(client,mesg)
  backup_pcvdata()
  if mesg == "grabframe":
   print "grabbing frame"
   justlicense.grabwebstreamframe()
  elif mesg == "M114":
   saa = justlicense.smoothiegetposition(sersmoothie)
   justlicense.upublisher(saa)
   saa = justlicense.readencoders(serencoder)
   #print saa
   justlicense.upublisher("X: "+saa['x'] + " Y: "+saa['y'])
   #justlicense.gettimeandwritetaskmanager(saa)
  elif re.match("^setwashval.*", mesg):
    sfl = re.split("-", mesg)
    justlicense.pumps(sermicrofluidic, sfl[0])
    time.sleep(1)
    justlicense.pumps(sermicrofluidic, sfl[1])
    justlicense.upublisher(msg)
  elif re.match("^manpcv", mesg):
    justlicense.pumps(sermicrofluidic, msg)
    sens = justlicense.readpumpsensor(sermicrofluidic)
    justlicense.upublisher(msg+' level '+sens)
  elif re.match("^feedbackpcv", mesg):
    justlicense.pumps(sermicrofluidic, msg)
    sens = justlicense.readpumpsensor(sermicrofluidic)
    justlicense.upublisher(msg+' level '+sens)
  elif re.match("^readheatsensor", mesg):
    sens = justlicense.readpumpsensor(sermicrofluidic)
    justlicense.upublisher(msg+' level '+sens)
  elif re.match("^setpcvval.*", mesg):
    justlicense.pumps(sermicrofluidic, msg)
    justlicense.upublisher(msg)
  elif re.match("^turnon5v.*", mesg):
   justlicense.turnon5v_valve(sermicrofluidic)
   justlicense.upublisher(msg)
  elif re.match("^turnoff5v.*", mesg):
   justlicense.turnoff5v_valve(sermicrofluidic)
   justlicense.upublisher(msg)
  elif re.match("^valve.*", mesg):
   vr = re.split("-", mesg)
   valve = vr[1] 
   valvepos = vr[2]
   justlicense.valvepos(valve,valvepos,sermicrofluidic)
   justlicense.upublisher(msg)
  elif re.match("^G1.*", mesg):
   tme = 1
   rr = justlicense.smoothiejog(mesg,tme,sersmoothie)
   print rr
   #justlicense.gettimeandwritetaskmanager("Finished moving to "+mesg)
   justlicense.upublisher("Finished moving to "+mesg)
   saa = justlicense.readencoders(serencoder)
   justlicense.upublisher("X: "+saa['x'] + " Y: "+saa['y'])
  elif re.match("G28.*",mesg):
   rr = justlicense.smoothiehoming(mesg,sersmoothie,client)
   print rr
   saa = justlicense.readencoders(serencoder)
   justlicense.upublisher("X: "+saa['x'] + " Y: "+saa['y'])
  elif re.match("G92.*",mesg):
   rr = justlicense.smoothiezeroing(mesg,sersmoothie,client)
   print rr
  elif re.match("M92.*",mesg):
   rr = justlicense.setstepspermm(sersmoothie,client,mesg)
   print rr
  elif re.match("M999",mesg):
   rr = justlicense.smoothierevive(sersmoothie,client)
   print rr
  elif re.match("^run ", mesg):
   #print "running macro "+mesg
   try: 
    print "just to see"
    justlicense.upublisher(mesg)
    justlicense.runmacro(sersmoothie,sermicrofluidic,serencoder,client)
    saa = justlicense.readencoders(serencoder)
    justlicense.upublisher("X: "+saa['x'] + " Y: "+saa['y'])
   except:
    print "can not send a mqtt"
  elif re.match("^linact", mesg):
   #print "linact called"
   resp = re.split("--", mesg)
   linac = resp[0]
   lact = resp[1]
   if lact == "home":
    justlicense.linacthome(sersteppers)
   if lact == "down":
    justlicense.linactdown(sersteppers)
   if lact == "up":
    justlicense.linactup(sersteppers)
   if lact == "info":
    info = justlicense.linactinfo(sersteppers)
    #justlicense.gettimeandwritetaskmanager(info)
    justlicense.upublisher(info)
   if re.match("stepsandrate .*",lact):
    llact = re.split(" ", lact)
    justlicense.linactstepsandrate(llact[1],sersteppers)	
  elif mesg == "Hello world!":
   print "got it!"






ports =  whichone()
justlicense.writeportjson(ports)

#justlicense.gettimeandwritetaskmanager("System in process of opening serial ports")
#smoothie connection
sersmoothie = serial.Serial('/dev/'+ports['smoothie'], 115200, timeout=0.5)
time.sleep(1)
a = sersmoothie.readlines()

#microfludic connection
sermicrofluidic = serial.Serial('/dev/'+ports['microfluidic'], 9600, timeout=0.5)
time.sleep(1)
a = sermicrofluidic.readlines()


#encoder
serencoder = serial.Serial('/dev/'+ports['softpot'], 115200, timeout=0.5)

#stepper connection
'''
sersteppers = serial.Serial('/dev/'+ports['steppers'], 9600, timeout=0.5)
time.sleep(1)
a = sersteppers.readlines()
'''
#justlicense.gettimeandwritetaskmanager("System is ready")


#ports =  whichone()
#justlicense.writeportjson(ports)

client = mqtt.Client()
client.connect("localhost",1883,0)
client.username_pw_set('smoothie', 'labbot3d')
client.on_connect = on_connect
client.on_message = on_message
client.loop_forever()

#justlicense.publisher(client,"System in process of opening serial ports")
#justlicense.publisher(client,"System is ready")
    





