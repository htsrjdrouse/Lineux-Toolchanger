import socket
import sys,re
import serial
import time
import gearman

from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'


#Connect to smoothie
ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0.5)
#ser = serial.Serial('/dev/ttyAMA0', 115200, timeout=0.5)
print 'Connecting to smoothie socket'

time.sleep(1)
a = ser.readlines()
print a
print ser.write('\r\n')
ser.write('version\r\n')
ser.write('M114\r\n')
a = ser.readlines()
#ser.write('M92X363.2Y301.6Z4606\r\n')
#a = ser.readlines()
print a

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
	bdata = data
	'''
	bdata = []
	bdata = re.split('_', data)
	'''
        reply = 'Command: ' + bdata
	print reply
	# Smoothie report position
	if re.match('reset smoothie',bdata):
		ser.write('reset\r\n');
	if re.match('^M114.*',bdata):
       		ser.write('M114\r\n')
		calry = ser.readlines()
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall(cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#"M92":"X:100.631 Y:113.75 Z:1637.8 F:60 E:140 \r"
	if re.match('^M92.*',bdata):
       		ser.write(bdata+'\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall('Steps per mm set at: '+cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#Get endstop status
	if re.match('^M119',bdata):
       		ser.write('M119\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		cal = re.sub('Steps per mm.*Fan:', '', cal)
		try:
			conn.sendall('Steps per MM set: '+cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	#Clear buffer
	if re.match('^clear',bdata):
       		ser.write('\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall(cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#Get version
	if re.match('^version',bdata):
       		ser.write('version\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall(cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#Turn on fan or turn it off
	#Turn on fan
	if re.match('M106',bdata):
       		ser.write(bdata+'\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		status = 'ON'
		try:
			conn.sendall('Fan: '+cal+ ' '+status)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#Turn off fan
	if re.match('M107',bdata):
       		ser.write(bdata+'\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		status = 'OFF'
		try:
			conn.sendall('Fan: '+cal+ ' '+status)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]



	#Homing 
	if re.match('^G28',bdata):
       		ser.write(bdata+'\r\n')
       		ser.write('M400\r\n')
       		ser.write('M114\r\n')
       		ser.write('M400\r\n')
		calry = ser.readlines()
		print calry
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall('Homed ['+bdata+']: '+cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	#Move 
	if re.match('^G1',bdata):
		print 'Sending the move command: '+bdata
       		ser.write(bdata)
		print 'Now waiting M400'
       		ser.write('M400\r\n')
		print 'Now get the position M114'
       		ser.write('M114\r\n')
		calry = ser.readlines()
		test = ' '.join(calry)
		test = re.sub('\r', '', test)
		test = re.sub('\n', '', test)
		print 'This is what I am searching for " ok C: X:110.000 Y:0.000 Z:0.000 E:0.000"'
		print calry
		print test
		if re.search('ok C: X:', test):
			pass

		else:
			print 'Whoops missed so bringing the loop'
			for i in range(0,20000):
				print 'check '+str(i)
				time.sleep(0.25)
				calry = ser.readlines()
				test = ' '.join(calry)
				test = re.sub('\r', '', test)
				test = re.sub('\n', '', test)
				if re.search('ok C: X:', test):
					print 'Ok we got it'
					break
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall(cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	if re.match('^G92',bdata):
       		ser.write(bdata+'\r\n')
		calry = ser.readlines()
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall('Positions reset: '+cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]



	#Wait until move finished 
	if re.match('^M400',bdata):
       		ser.write('M400\r\n')
		calry = ser.readlines()
		cal = ''
		for i in calry:
		   i =re.sub('\n', '',i)
		   i =re.sub('\r', '',i)
		   cal = cal + i + ' <htsrepstrap>'
		cal = cal+'\r\n'
		try:
			conn.sendall('M400: wait until finished '+cal)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	if re.match('^close',bdata):
		s.close()
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


