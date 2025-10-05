import socket
import sys,re
import serial
import time

from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

#Connect to Arduino board
ser2 = serial.Serial('/dev/ttyACM0', 9600)
b = ser2.readline()
print b
b = ser2.readline()
print b
b = ser2.readline()
print b
b = ser2.readline()
print b
b = ser2.readline()
print b
b = ser2.readline()
print b


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
    #infinite loop so that function do not terminate and thread do not end.
    while True:
         
        #Receiving from client
	data = ''
        data = conn.recv(1024)
	bdata = []
	bdata = re.split('_', data)
        reply = 'Command: ' + data
	print reply
	for i in range(0,len(bdata)):
		print bdata[i]
		# Arduino power relays and linear actuator stuff	
		# System power relays
		if re.match('^poweron.*',bdata[i]):
        		ser2.write('#5002')
        		ser2.write('#5004')
        		ser2.write('#5006')
		if re.match('^poweroff.*',bdata[i]):
        		ser2.write('#5003')
        		ser2.write('#5005')
        		ser2.write('#5007')
	else:
        	time.sleep(0.1) 
		
        if not data: 
            break
     
    #came out of loop
    conn.close()
 
#now keep talking with the client
while 1:
    #wait to accept a connection - blocking call
    conn, addr = s.accept()
    print 'Connected with ' + addr[0] + ':' + str(addr[1])
    t = '' 
    #start new thread takes 1st argument as a function name to be run, second is the tuple of arguments to the function.
    start_new_thread(clientthread ,(conn,t))

s.close()
