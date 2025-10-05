import gearman
import serial
import time
import telnetlib
import re,os
import json
import paho.mqtt.client as mqtt
import tmecalcperline as tme



def writejson(var,dat):
        filepath = 'smoothiestream.node/smoothie.json'
        pcv = open(filepath)
        pcvdata = json.load(pcv)
        pcv.close()
	if re.match('begin', dat):
          pcvdata['track'] = dat
 	else:
          pcvdata['track'] = pcvdata['track']+'<br>'+dat
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
 MQTT_TOPIC = "topic/test"
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





def s1valvechange(gearman_worker, gearman_job):
    tn = telnetlib.Telnet('172.24.1.82', 8887)
    time.sleep(1)
    tn.write(gearman_job.data)
    tt = re.split("_", gearman_job.data)
    time.sleep(int(tt[1]))
    tn.close()
    return gearman_job.data

def task_listener_reverse(gearman_worker, gearman_job):
    print 'Reversing string: ' + gearman_job.data
    return gearman_job.data[::-1]

def getposition(gearman_worker, gearman_job):
    publish('begin')
    publish('M114')
    ser.write('M114\r\n')
    time.sleep(int(gearman_job.data))
    a = ser.readlines()
    adx = [ i for i, word in enumerate(a) if re.search('^ok C: X:',word) ]
    b = a[adx[0]]
    print b
    publish(b)
    #b = a[len(a)-1]
    publish('Finished')
    return b

def getendstopstatus(gearman_worker, gearman_job):
    publish('begin')
    publish('M119')
    ser.write('M119\r\n')
    print gearman_job.data
    time.sleep(int(gearman_job.data))
    a = ser.readlines()
    print a
    adx = [ i for i, word in enumerate(a) if re.search('^min',word) ]
    print adx[0]
    print a[adx[0]]
    publish(a[adx[0]])
    publish('Finished')
    return b






def move(gearman_worker, gearman_job):
    publish('begin')
    tt = re.split("_", gearman_job.data)
    #print gearman_job.data+'\r\n'
    #ser.write(gearman_job.data+'\r\n')
    print tt[0]+'\r\n'
    ser.write(tt[0]+'\r\n')
    tt = re.split("_", gearman_job.data)
    msg = "time it should take: "+tt[1]
    publish(tt[0])
    publish(msg)
    publish('Finished')
    return 'done'


'''
def relativemove(gearman_worker, gearman_job):
    ser.write('G90'+'\r\n')
    print gearman_job.data+'\r\n'
    ser.write(gearman_job.data+'\r\n')
    tt = re.split("_", gearman_job.data)
    print tt[1]
    time.sleep(int(tt[1]))
    ser.write('G91'+'\r\n')
    return 'done'
'''




def runthefile(gearman_worker, gearman_job):
    publish('begin')
    msg = "cmd: gcode.files/"+str(gearman_job.data)
    publish(msg)
    [filename,tmedelay] = re.split('_', str(gearman_job.data))
    msg = "run time: "+tmedelay
    publish(msg)
    tt = tme.tmecalc(filename)	
    #ff = open("/home/richard/gcode.files/"+filename)
    ffry = []
    tffry = []
    for i in tt:
        i = re.sub("\r|\n", "", i)
	print i
	(gg,t) = re.split("_", i)
        ffry.append(gg)
        tffry.append(t)
    ct = 0
    print len(ffry)
    for j in range(0,len(ffry)+1):
     print j
     if re.match("^G|M.*", j):
       print "sending "+ffry[j]
       #ser.write(ffry[j]+"\r\n")
       time.delay(float(tffry[j]))
       #ser.readline()
     ct = ct + 1
    '''
    lnth = len(ffry)
    print ffry
    print lnth
    ct = 0
    for i in ffry:
      print i
      trk = {}
      prc = (ct / lnth) * 100
      ct = ct + 1
      if re.match("^G|M.*", i):
       ser.write(i+"\r\n")
       print i
       ser.readline()
     
      publish('track',str(prc) + ' '+i)
    '''
    print "the time delay: "+tmedelay
    time.sleep(float(tmedelay))
    print "finished"
    publish('Finished')
    return "runfile "+filename+" finished"

def readtheline(gearman_worker, gearman_job):
    time.sleep(1)
    a = ser.readlines()
    b = a[len(a)-1]
    return b


#Connect to smoothie
ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0.5)
time.sleep(2)
a = ser.readlines()
print a
#ser.write('\r\n')
#ser.write('version\r\n')


gm_worker = gearman.GearmanWorker(['localhost:4730'])


gm_worker.register_task('reverse', task_listener_reverse)
gm_worker.register_task('M114', getposition)
gm_worker.register_task('M119', getendstopstatus)
gm_worker.register_task('move', move)
gm_worker.register_task('s1valve', s1valvechange)
gm_worker.register_task('runfile', runthefile)
gm_worker.register_task('readline', readtheline)
gm_worker.work()

