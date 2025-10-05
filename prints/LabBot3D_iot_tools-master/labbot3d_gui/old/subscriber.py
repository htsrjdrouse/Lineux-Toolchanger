import paho.mqtt.subscribe as subscribe

def on_message_print(client, userdata, message):
    #print("%s %s" % (message.topic, message.payload))
    #msg = "%s %s" % (message.topic, message.payload)
    msg = "%s" % (message.payload)
    print msg

subscribe.callback(on_message_print, "test-mosquitto", hostname="localhost")
