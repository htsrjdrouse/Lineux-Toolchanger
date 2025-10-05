import paho.mqtt.subscribe as subscribe
import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt
import os,commands,re

def on_message_print(client, userdata, message):
    #print("%s %s" % (message.topic, message.payload))
    #msg = "%s %s" % (message.topic, message.payload)
    
    msg = "%s" % (message.payload)
    print msg
    if msg == "webstream start":
     cmd = "ps aux | grep 'python3'"
     try: 
      a= commands.getstatusoutput(cmd)[1]
      print a
      b = re.split('\r|\n', a)
      if re.match('.*python3 picam-streamer.py', b[0]):
       print "its running"
      else:
        print "running webstream"
        #publish.single("labbot3d_1_control", "cam webstream start", hostname="192.168.1.80",auth={'username': 'smoothie', 'password': 'labbot3d'})
        publish.single("labbot3d_1_control", "cam webstream start", hostname="172.24.1.58",auth={'username': 'smoothie', 'password': 'labbot3d'})
        os.system('python3 picam-streamer.py 320 240 > /dev/null &')
     except:
      pass
    if msg == "webstream stop":
     print "stopping webstream"
     cmd = "ps aux | grep 'picam-streamer.py'"
     #publish.single("labbot3d_1_control", "cam webstream stop", hostname="92.168.1.80",auth={'username': 'smoothie', 'password': 'labbot3d'})
     publish.single("labbot3d_1_control", "cam webstream stop", hostname="172.24.1.141",auth={'username': 'smoothie', 'password': 'labbot3d'})
     try: 
      a= commands.getstatusoutput(cmd)[1]
      b = re.split('\r|\n', a)
      d = re.split('\s+', b[0])
      os.system('sudo kill '+d[1])
     except:
      pass

subscribe.callback(on_message_print, "test-mosquitto", hostname="localhost")
