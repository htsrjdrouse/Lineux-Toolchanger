import socket
import sys,re
import serial
import time
import json

def writejson(var,dat):
	dat = re.sub('\r|\n', '', dat)
	pcv = open('pcvdatajson')
	pcvdata = json.load(pcv)
	pcv.close()
	pcvdata[var] = dat
	pcvdatar = json.dumps(pcvdata)
	pcv = open('pcvdatajson', 'w')
	pcv.write(pcvdatar)
	pcv.close()


from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8887 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'
ser = serial.Serial('/dev/ttyACM0', 9600)
#b = ser.readline()

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


		## THIS IS THE SYRINGE PUMP COMMANDS
		# Checks to see if the syringe arduino is responding
		# Refer to syringeserver_piezobox.ino for details
		'''
		The syringeserver_piezobox is firmware on an arduino that sends commands to syringe pump arduino uno 
		microcontroller	and piezoelectric amplifier teensy microcontrollers

		After the s or p then you identify what number pump or amplifier 
	
		'''

		## THIS IS THE PIEZO AMPLIFIER COMMANDS
		# Checks to see if the piezo amplifier is responding
		if re.match('^p1 check',bdata[i]):
        	   ser.write('p1 connect')
		   dat = ser.readline()
		   dat2 = ser.readline()
		   #dat3 = dat + ',' + dat2
		   try:
			conn.sendall(dat2)
		   except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
		# Returns the piezo amplifier settings
		if re.match('^p1 settings',bdata[i]):
        	   ser.write('p1 settings')
		   dat = ser.readline()
		   print dat
		   writejson('p1settings',dat)
		   try:
			conn.sendall(dat)
		   except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
		# Generate drop or droplets
		if re.match('^p1 dispense',bdata[i]):
        	   ser.write('p1 dispense')
		# Stroboscope on
		if re.match('^p1 stroboscope on',bdata[i]):
        	   ser.write('p1 stroboscope')
		# Stroboscope off
		if re.match('^p1 stroboscope off',bdata[i]):
        	   ser.write('p1 connect')
		   dat = ser.readline()
		   dat2 = ser.readline()
		# Change volt 
		if re.match('^p1 volt.*',bdata[i]):
		   print bdata[i]
		   fgm = re.match('^p1 volt (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 volt '+dat)
		   writejson('p1volt',dat)
		# Change frequency 
		if re.match('^p1 frequency.*',bdata[i]):
		   fgm = re.match('^p1 frequency (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 frequency '+dat)
		   writejson('piezofreq',dat)
		# Change pulse width 
		if re.match('^p1 pulse.*',bdata[i]):
		   fgm = re.match('^p1 pulse (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 pulse '+dat)
		   writejson('p1pulse',dat)
		# Change leddelay
		if re.match('^p1 leddelay.*',bdata[i]):
		   fgm = re.match('^p1 leddelay (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 leddelay '+dat)
		   writejson('p1leddelay',dat)
		# Change ledtime
		if re.match('^p1 ledtime.*',bdata[i]):
		   fgm = re.match('^p1 ledtime (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 ledtime '+dat)
		   writejson('p1ledtime',dat)
		# Change drops
		if re.match('^p1 drops.*',bdata[i]):
		   fgm = re.match('^p1 drops (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 drops '+dat)
		   writejson('p1drops',dat)
		# Set flag
		if re.match('^p1setflag.*',bdata[i]):
		   fgm = re.match('^p1setflag (.*)',bdata[i])
		   dat = re.sub('\r|\n', '', fgm.group(1))
        	   ser.write('p1 setflag '+dat)

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

