import socket
import sys,re
import serial
import time

from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

t = open('/home/pi/marlin.socket.connect.log','w')

#Connect to RAMPS arduino
#ser = serial.Serial('/dev/ttyACM1', 115200, timeout=1)
ser = serial.Serial('/dev/ttyUSB0',9600)

#Bind socket to local host and port
try:
    s.bind((HOST, PORT))
except socket.error , msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()
     
print 'Socket bind complete'
 
#Start listening on socket
s.listen(0.1)
print 'Socket now listening'
 
#Function for handling connections. This will be used to create threads
def clientthread(conn,t):
    #Sending message to connected client
    conn.send('RAMPS server:\n') #send only takes string


    #infinite loop so that function do not terminate and thread do not end.
    while True:
         
        #Receiving from client
	data = ''
        data = conn.recv(1024)
	bdata = []
	bdata = re.split('_', data)
        reply = 'Command: ' + data
	print reply
		
        if not data: 
            break
     
    #came out of loop
    conn.close()
 
#now keep talking with the client
while 1:
    #wait to accept a connection - blocking call
    conn, addr = s.accept()
    print 'Connected with ' + addr[0] + ':' + str(addr[1])
     
    #start new thread takes 1st argument as a function name to be run, second is the tuple of arguments to the function.
    start_new_thread(clientthread ,(conn,t))

t.close() 
s.close()
