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

for i in range(0,13):
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
		if re.match('^poweroff.*',bdata[i]):
        		ser2.write('#5003')
		# Linear actuator and pololu Jrk 21v3 board
		# Report position
		if re.match('^reportposition.*',bdata[i]):
        		ser2.write('#5000')
			pos = ser2.readline()
			print pos
			try:
				conn.sendall(pos)
			except socket.error , msg:
    				print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

		# Report liquid level position
		if re.match('^reportliquidlevel.*',bdata[i]):
        		ser2.write('#4000')
			pos = ser2.readline()
			print pos
			try:
				conn.sendall(pos)
			except socket.error , msg:
    				print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
		# set liquid level position
		if re.match('^setliquidlevel.*',bdata[i]):
			a = re.match('^setliquidlevel (.*)',bdata[i])
			level = int(a.group(1)) + 6499
        		ser2.write('#'+str(level))
			'''
			pos = "Level set to "+a.group(1)
			try:
				conn.sendall(pos)
			except socket.error , msg:
    				print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
			'''

		# Turn off motor
		if re.match('^motoroff.*',bdata[i]):
        		ser2.write('#5001')
		# Go to position
		if re.match('^goto(.*).*',bdata[i]):
			gp = re.match('^goto(.*)$',bdata[i])
			val = gp.group(1)
			if (int(val) < 3500):
				val = '#'+val
				ser2.write(val)	
		if re.match('^WASHON.*',bdata[i]):
			ser2.write('#5004')	
		if re.match('^WASHOFF.*',bdata[i]):
			ser2.write('#5005')	
		if re.match('^DRYON.*',bdata[i]):
			ser2.write('#5006')	
		if re.match('^DRYOFF.*',bdata[i]):
			ser2.write('#5007')	
		if re.match('^pressurepumpon.*',bdata[i]):
			print 'pressure pump on'
			ser2.write('#5008')	
		if re.match('^pressurepumpoff.*',bdata[i]):
			print 'pressure pump off'
			ser2.write('#5009')	
		'''
		if re.match('^fan on.*',bdata[i]):
			ser2.write('#5010')	
		if re.match('^fan off.*',bdata[i]):
			ser2.write('#5011')	
		'''
		if re.match('^headcamled (.*)$',bdata[i]):
			gp = re.match('^headcamled (.*)$',bdata[i])
			val = gp.group(1)
			if ((int(val) > 5999) and  (int(val) < 6255)):
				val = '#'+val
				ser2.write(val)	
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
