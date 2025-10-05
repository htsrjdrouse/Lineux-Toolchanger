import serial
import time
import re,os,sys
import json
import paho.mqtt.client as mqtt
import tmecalcperline as tme
import socket
import telnetlib



def writejson(var,dat):
        filepath = '/var/www/html/smoothiedriver/smoothie.json'
        pcv = open(filepath)
        pcvdata = json.load(pcv)
        pcv.close()
	if re.match('begin', dat):
          pcvdata['track'] = []
          pcvdata['track'].append('begin')
 	else:
          #pcvdata['track'] = pcvdata['track']+'<br>'+dat
          pcvdata['track'].append(str(dat))
        pcvdatar = json.dumps(pcvdata)
        pcv = open(filepath, 'w')
        pcv.write(pcvdatar)
        pcv.close()




# Define on_connect event Handler
def on_connect(mosq, obj, rc):
	print "Connected to MQTT Broker"

# Define on_publish event Handler
def on_publish(client, userdata, mid):
	pass
	#print "Message Published..."




def publish(msg):
 writejson('track',msg)
 # Define Variables
 MQTT_BROKER = "localhost"
 MQTT_PORT = 1883
 MQTT_KEEPALIVE_INTERVAL = 45
 MQTT_TOPIC = "labbot"
 MQTT_MSG = msg
 # Initiate MQTT Client
 mqttc = mqtt.Client()

 # Register Event Handlers
 mqttc.username_pw_set('smoothie', 'labbot3d')
 mqttc.on_publish = on_publish
 mqttc.on_connect = on_connect

 # Connect with MQTT Broker
 mqttc.connect(MQTT_BROKER, MQTT_PORT, MQTT_KEEPALIVE_INTERVAL) 

 # Publish message to MQTT Topic 
 mqttc.publish(MQTT_TOPIC,MQTT_MSG)

 # Disconnect from MQTT_Broker
 mqttc.disconnect()



def runfile(cmd):
  filename = re.sub('runfile ', '', cmd)
  print filename
  tt = tme.tmecalc(filename)	
  writejson('track','begin')
  for i in tt:
   print i 
   cd,tm = re.split('_', i)
   publish(cd)
   print cd
   print "sleeping ..."+str(tm)
   time.sleep(float(tm))


cmd = sys.argv[1]

if re.match("^runfile .*", cmd):
  runfile(cmd)
  publish("finished")
elif re.match("^M114", cmd):
  writejson('track','begin')
  publish(cmd)
  time.sleep(1)
  publish("finished")
elif re.match("^[G|M]", cmd):
  writejson('track','begin')
  publish(cmd)
  publish("finished")
elif re.match("^valveservo", cmd):
  writejson('track','begin')
  publish(cmd)
  publish("finished")




