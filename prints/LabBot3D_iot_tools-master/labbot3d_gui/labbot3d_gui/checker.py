import os
import paho.mqtt.client as mqtt 


cmd = "valve-1.1.1.0.1.0.1.1-output" 
ccmd = "mosquitto_pub -h '172.24.1.115' -t 'test-mosquitto' -m '"+cmd+"'" 
print ccmd
os.system(ccmd) 

