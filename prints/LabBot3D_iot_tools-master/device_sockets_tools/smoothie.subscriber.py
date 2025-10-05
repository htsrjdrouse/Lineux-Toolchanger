import paho.mqtt.client as mqtt
import serial
import telnetlib
import re
import json


def writejson(var,dat):
	dat = re.sub('\r|\n', '', dat)
	#pcv = open('smoothie.json')
	pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
	pcvdata = json.load(pcv)
	pcv.close()
	pcvdata[var]=dat
	#pcvdata[var]=pcvdata[var]+'<br>'+dat
	pcvdatar = json.dumps(pcvdata)
	pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
	#pcv = open('smoothie.json', 'w')
	pcv.write(pcvdatar)
	pcv.close()










def m114parser(strr):
 coord = {}
 aa  =re.match('^.*X:(.*) Y:(.*) Z:(.*) E:(.*)$', strr)
 coord['X']= float(aa.group(1))
 coord['Y']= float(aa.group(2))
 coord['Z']= float(aa.group(3))
 coord['E']= float(aa.group(4))
 #pcv = open('smoothie.json')
 pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
 pcvdata = json.load(pcv)
 pcv.close()
 pcvdata['parsedposition'] = coord
 pcvdatar = json.dumps(pcvdata)
 #pcv = open('smoothie.json', 'w')
 pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
 pcv.write(pcvdatar)
 pcv.close()
 return coord





#connect to smoothie
ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0.5)
ser.readlines()

# Define Variables
MQTT_BROKER = "localhost"
MQTT_PORT = 1883
MQTT_KEEPALIVE_INTERVAL = 45
#MQTT_TOPIC = "testTopic"
MQTT_TOPIC = "labbot"


# Define on_connect event Handler
def on_connect(mosq, obj, rc):
	#Subscribe to a the Topic
	mqttc.subscribe(MQTT_TOPIC, 0)

# Define on_subscribe event Handler
def on_subscribe(mosq, obj, mid, granted_qos):
    print "Subscribed to MQTT Topic"

# Define on_message event Handler
def on_message(mosq, obj, msg):
	if re.match('^[G1|M]', str(msg.payload)):
          print "smoothie ... "+str(msg.payload)
	  ser.write(str(msg.payload)+"\r\n")
	  if re.match('M114', str(msg.payload)):
	    rawdat = ser.readlines()
            adx = [ i for i, word in enumerate(rawdat) if re.search('^ok C: X:',word) ]
            b = rawdat[adx[0]]
	    print b
	    coord = m114parser(b)
	    writejson('smoothielastcommand','G1 X'+str(coord['X'])+' Y'+str(coord['Y'])+' Z'+str(coord['Z'])+' F1000')
	    #writejson('parsedposition',coord)
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
	    pcvdata = json.load(pcv)
	    pcv.close()
	    pcvdata['parsedposition']=coord
	    pcvdatar = json.dumps(pcvdata)
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
	    pcv.write(pcvdatar)
	    pcv.close()
	    #print rawdat
          elif re.match('^G28 X0', str(msg.payload)):
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
	    pcvdata = json.load(pcv)
	    pcv.close()
	    pcvdata['parsedposition']['X']=0
	    pcvdatar = json.dumps(pcvdata)
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
	    pcv.write(pcvdatar)
	    pcv.close()
          elif re.match('^G28 Y0', str(msg.payload)):
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
	    pcvdata = json.load(pcv)
	    pcv.close()
	    pcvdata['parsedposition']['Y']=0
	    pcvdatar = json.dumps(pcvdata)
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
	    pcv.write(pcvdatar)
	    pcv.close()
          elif re.match('^G28 Z0', str(msg.payload)):
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset')
	    pcvdata = json.load(pcv)
	    pcv.close()
	    pcvdata['parsedposition']['Z']=0
	    pcvdatar = json.dumps(pcvdata)
	    pcv = open('/var/www/html/smoothiedriver/nx.imgdataset','w')
	    pcv.write(pcvdatar)
	    pcv.close()
	  ser.readlines()
	elif re.match("^valveservo",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^washon",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^washoff",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^dryon",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^dryoff",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^turnon5v",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^turnoff5v",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^manpcv",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
           #resp = tn.read_until('ok', 1)
	elif re.match("^manpcv",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^feedbackpcv",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^pcvon",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^pcvoff",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^aforward",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^abackward",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^asteps",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^asteprate",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))
	elif re.match("^ahoming",str(msg.payload)):
           tn = telnetlib.Telnet('192.168.122.101', 8888)
           tn.write(str(msg.payload))



# Initiate MQTT Client
mqttc = mqtt.Client()

mqttc.username_pw_set('smoothie', 'labbot3d')

# Register Event Handlers
mqttc.on_message = on_message
mqttc.on_connect = on_connect
mqttc.on_subscribe = on_subscribe

# Connect with MQTT Broker
mqttc.connect(MQTT_BROKER, MQTT_PORT, MQTT_KEEPALIVE_INTERVAL )

# Continue the network loop
mqttc.loop_forever()

