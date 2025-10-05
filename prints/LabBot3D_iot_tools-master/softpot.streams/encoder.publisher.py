# Import package
import paho.mqtt.client as mqtt
import time
import Adafruit_ADS1x15

# Define Variables
#MQTT_BROKER = "MQTT Broker IP or DNS Name"
MQTT_BROKER = "localhost"
MQTT_PORT = 1883
MQTT_KEEPALIVE_INTERVAL = 45
#MQTT_TOPIC = "testTopic"
MQTT_TOPIC = "topic/test"
MQTT_MSG = "Hello MQTT testing"

adc = Adafruit_ADS1x15.ADS1115()
GAIN = 1

# Define on_connect event Handler
def on_connect(mosq, obj, rc):
	print "Connected to MQTT Broker"

# Define on_publish event Handler
def on_publish(client, userdata, mid):
	print "Message Published..."

# Initiate MQTT Client
mqttc = mqtt.Client()

# Register Event Handlers
mqttc.username_pw_set('pi', '6pack5')
mqttc.on_publish = on_publish
mqttc.on_connect = on_connect

# Connect with MQTT Broker
mqttc.connect(MQTT_BROKER, MQTT_PORT, MQTT_KEEPALIVE_INTERVAL) 

# Publish message to MQTT Topic 
while True:
 values = [0]*4
 for i in range(4):
  values[i] = adc.read_adc(i, gain=GAIN)
 datr= str(values[0])+"_"+str(values[1])+"_"+str(values[2])+"_"+str(values[3])
 MQTT_MSG = datr
 mqttc.publish(MQTT_TOPIC,MQTT_MSG)
 time.sleep(0.5)

# Disconnect from MQTT_Broker
mqttc.disconnect()
