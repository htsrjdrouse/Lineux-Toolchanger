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
   if re.match("washdrypcv.*", resp):
    ports['microfluidic'] = 'ttyACM'+str(i)
   elif re.match("piezocontroller1", resp):
    ports['piezocontroller1'] = 'ttyACM'+str(i)
  except:
    pass
 print ports
 return ports



def on_connect(client, userdata, flags, rc):
  #print("Connected with result code "+str(rc))
  client.subscribe("labbot3dstroboscope")

def gettimeandwritetaskmanager(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  aa['mesg'] = mesg + ' -- ' +tts
  writetaskmanager(aa)
  return tts


def on_message(client, userdata, msg):
  mesg =  msg.payload.decode()
  print "48 here is the message "+mesg
  #justlicense.gettimeandwritetaskmanager(mesg)
  #justlicense.publisher(client,mesg)
  #backup_pcvdata()
  if mesg == "grabframe":
   justlicense.grabwebstreamframe()
  #elif re.match("^turnon5v", mesg):
  elif mesg == "pcvon":
    justlicense.pumps(sermicrofluidic, 'pcvon')
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^analyzedroplets.*", mesg):
    justlicense.analyzedroplets(mesg)
  elif re.match("^syringemove.*", mesg):
    print mesg
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif mesg == "pcvoff":
    justlicense.pumps(sermicrofluidic, 'pcvoff')
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^washpcvon.*", mesg):
    justlicense.pumps(sermicrofluidic, mesg)
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^washpcvoff.*", mesg):
    justlicense.pumps(sermicrofluidic, mesg)
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^valve.*", mesg):
   print "valve position called"
   #needs to be adapted
   justlicense.upublisher(mesg)
   os.system(ccmd) 
   time.sleep(1)
  elif mesg == "turnon5v":
   justlicense.turnon5v_valve(sermicrofluidic)
   time.sleep(1)
   justlicense.upublisher(mesg)
   time.sleep(1)
  #elif re.match("^turnoff5v", mesg):
  elif mesg == "turnoff5v":
   justlicense.turnoff5v_valve(sermicrofluidic)
   time.sleep(1)
   justlicense.upublisher(mesg)
   time.sleep(1)
  elif re.match("^setwashval.*", mesg):
    sfl = re.split("-", mesg)
    washval = re.sub("setwashval ", "", sfl[0])
    dryval = re.sub("setdryval ", "", sfl[1])
    microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json')
    microfljson = json.load(microfl)
    microfljson['wash']['washval'] = int(washval)
    microfljson['waste']['wasteval'] = int(dryval)
    microfl.close()
    microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json','w')
    microfldatar = json.dumps(microfljson)
    microfl.write(microfldatar)
    microfl.close()
    justlicense.pumps(sermicrofluidic, sfl[0])
    time.sleep(1)
    justlicense.pumps(sermicrofluidic, sfl[1])
    justlicense.upublisher(mesg)
  elif mesg == "washon":
    justlicense.pumps(sermicrofluidic, 'washon')
    justlicense.upublisher(mesg)
  elif mesg == "washoff":
    justlicense.pumps(sermicrofluidic, 'washoff')
    justlicense.upublisher(mesg)
  elif mesg == "wasteon":
    justlicense.pumps(sermicrofluidic, 'dryon')
    justlicense.upublisher(mesg)
  elif mesg == "wasteoff":
    justlicense.pumps(sermicrofluidic, 'dryoff')
    justlicense.upublisher(mesg)
  elif mesg == "manpcv":
    justlicense.pumps(sermicrofluidic, 'manpcv')
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif mesg == "feedbackpcv":
    #sens = justlicense.readpumpsensor(sermicrofluidic)
    #time.sleep(1)
    justlicense.pumps(sermicrofluidic, 'feedbackpcv')
    time.sleep(1)
    justlicense.upublisher(mesg)
    #justlicense.upublisher(mesg+' level '+sens)
  elif re.match("^readheatsensor", mesg):
    sens = justlicense.readpumpsensor(sermicrofluidic)
    time.sleep(1)
    justlicense.upublisher(mesg+' level '+sens)
   #justlicense.gettimeandwritetaskmanager(saa)
  elif re.match("^setheatval", mesg):
    justlicense.pumps(sermicrofluidic, mesg)
    time.sleep(1)
    #sens = justlicense.readpumpsensor(sermicrofluidic)
    #time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^heaton", mesg):
    justlicense.pumps(sermicrofluidic, 'heaton')
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif re.match("^heatoff", mesg):
    justlicense.pumps(sermicrofluidic, 'heatoff')
    time.sleep(1)
    justlicense.upublisher(mesg+' level '+sens)
  elif re.match("^setwashval.*", mesg):
    sfl = re.split("-", mesg)
    justlicense.pumps(sermicrofluidic, sfl[0])
    time.sleep(1)
    justlicense.pumps(sermicrofluidic, sfl[1])
    justlicense.upublisher(mesg)
  elif re.match("^setpcvval.*", mesg):
    justlicense.pumps(sermicrofluidic, mesg)
    time.sleep(1)
    justlicense.upublisher(mesg)
  elif mesg == "Hello world!":
   print "got it!"



ports =  whichone()
justlicense.writeportjson(ports)

status = justlicense.getmacaddr()
ipadd = open('/home/pi/config.json')
ipaddjson = json.load(ipadd)
ipadd.close()
print "username "+ipaddjson['username']
print "password  "+ipaddjson['password']

if status == 'yes':
 sermicrofluidic = serial.Serial('/dev/'+ports['microfluidic'], 9600, timeout=0.5)
 time.sleep(1)
 a = sermicrofluidic.readlines()
 try: 
  serpiezocontroller1 = serial.Serial('/dev/'+ports['piezocontroller1'], 9600, timeout=0.5)
  a = serpiezocontroller1.readlines()
 except: 
  serpiezocontroller1 = 0
 client = mqtt.Client()
 client.connect("localhost",1883,0)
 client.username_pw_set(ipaddjson['username'], ipaddjson['password'])
 client.on_connect = on_connect
 client.on_message = on_message
 client.loop_forever()
else:
    print "Sorry this computer is not registered to run this software"



