import paho.mqtt.subscribe as subscribe
import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt
import os,commands,re
import json


def on_message_print(client, userdata, message):
    #print("%s %s" % (message.topic, message.payload))
    #msg = "%s %s" % (message.topic, message.payload)
    ipadd = open('/home/pi/config.json')
    ipaddjson = json.load(ipadd)
    ipadd.close()
    print ipaddjson['callerip']
    msg = "%s" % (message.payload)
    print msg
    if msg == "checkconnection":
     print "connection is established"
    if msg == "piezocontroller start":
     cmd = "ps aux | grep 'python caller.labbot3d.subscriber.py' | grep -v grep"
     try: 
      a= commands.getstatusoutput(cmd)[1]
      print a
      b = re.split('\r|\n', a)
      if a: 
       print "its running"
      else:
        print "starting piezocontroller"
        #publish.single("labbot3d_1_control", "cam webstream start", hostname="192.168.1.80",auth={'username': 'smoothie', 'password': 'labbot3d'})
        #publish.single(ipaddjson['topic'], "cam webstream start", hostname=ipaddjson['callerip'],auth={'username':ipaddjson['username'], 'password': ipaddjson['password']})
        os.system('sudo /home/pi/start.scripts > /dev/null &')
        #cmd = 'mosquitto_pub -h 192.168.1.65 -p 1883 -t labbot3dstroboscope -u amplmicrofl -P labbot3d -d -m "cam 1 webstream start"' 
        #os.system(cmd)
     except:
      pass
    if msg == "piezocontroller stop":
     print "stopping piezocontroller"
     cmd = "ps aux | grep 'caller.labbot3d.subscriber.py' | grep -v grep"
     a= commands.getstatusoutput(cmd)[1]
     print a
     b = re.split('\r|\n', a)
     d = re.split('\s+', b[0])
     try: 
      print 'kill -9 '+d[1]
      os.system('sudo kill -9 '+d[1])
     except:
      pass
     print "stopping nodetracker"
     cmdd = "ps aux | grep 'node /var/www/html/labbot3damp_gui/labbot3dstream.node/index.js' | grep -v grep"
     aa= commands.getstatusoutput(cmdd)[1]
     print a
     b = re.split('\r|\n', aa)
     d = re.split('\s+', b[0])
     print 'kill -9 '+d[1]
     try: 
      print 'kill -9 '+d[1]
      os.system('sudo kill -9 '+d[1])
     except:
      pass
     #publish.single("labbot3d_1_control", "cam webstream stop", hostname="92.168.1.80",auth={'username': 'smoothie', 'password': 'labbot3d'})
     #publish.single(ipaddjson['topic'], "cam webstream stop", hostname=ipaddjson['callerip'],auth={'username': ipaddjson['username'], 'password': ipaddjson['password']})
     #cmd = 'mosquitto_pub -h 192.168.1.65 -p 1883 -t labbot3dstroboscope -u amplmicrofl -P labbot3d -d -m "cam 1 webstream stop"' 
     #os.system(cmd)

subscribe.callback(on_message_print, "labbot3dstrob", hostname="localhost")
