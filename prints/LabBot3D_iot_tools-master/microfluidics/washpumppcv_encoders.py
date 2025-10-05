import socket
import sys,re,os
import serial
import time
import operator

from thread import *

#X:0.000 Y:0.000 Z:0.000 E:0.000 

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

time.sleep(1)

#here I need to establish a serial connection to arduino
print "attaching to serial port 1"
#a = serial.Serial('/dev/ttyUSB1', 9600)
a = serial.Serial('/dev/ttyACM0', 9600)
time.sleep(1)
a.readline()
print "attaching to serial port 0"
b = serial.Serial('/dev/ttyACM1', 9600)
time.sleep(1)
b.readline()

print "binding to socket"

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
	time.sleep(1)
	data = ''
        data = conn.recv(1024)
	bdata = data
        reply = 'Command: ' + bdata
	print reply
	# washon
	if re.match('^help wash.*',bdata):
	  print 'wash_dry_pcv_kill help'
	  print 'washon: washpin on'
	  print 'washoff: washpin on'
	  print 'setwashval: adjust the washing flow rate'
	  print 'dryon: drypin on'
	  print 'dryoff: drypin off'
	  print 'setdryval: adjust the washing flow rate'
	  print 'setpcvval: adjust the pressure compensation flow rate'
	  print 'setpumpdelay: adjust the delay time after the liquid level sensor turns on and the pump turns off'
	  print 'pcvon: manually turn pcv pump on (this turns off closed loop feedback)'
 	  print 'pcvoff: manually turn pcv pump off (this turns off closed loop feedback)'
	  print 'manpcv: turn on pcv manual mode'
	  print 'feedbackpcv: turn off pcv manual mode and enable closed loop feedback'
	  print 'revivemotors: killPin 0 and enablePin LOW'
	  print 'killmotors: killPin 1 and enablePin HIGH'
	  print 'valveservo: set the PWM valve to move the valve'
	elif re.match('^help linearactuator.*',bdata):
	  print 'noconveyer_linearactuator_kill help 9 lines'
	  print 'ainfo: linearactuator status'
	  print 'revivemotors: killPin 0 and enablePin LOW'
	  print 'killmotors: killPin 1 and enablePin HIGH'
	  print 'ahoming: home linearactuator'
	  print 'abackward: move backwards'
	  print 'aforward: move forwards'
	  print 'asteps: set steps'
	  print 'arate: set step rate'
	elif re.match('ainfo',bdata):
	  b.write('ainfo')
	  rresp = b.readline()
	  print rresp
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('revivemotors',bdata):
	  b.write('revivemotors')
	elif re.match('killmotors',bdata):
	  b.write('killmotors')
	elif re.match('ahoming',bdata):
	  b.write('ahoming')
	elif re.match('abackward',bdata):
	  b.write('abackward')
	elif re.match('aforward',bdata):
	  b.write('aforward')
	elif re.match('asteps',bdata):
	  c = re.match('asteps (.*)', bdata)
	  b.write('asteps '+c.group(1))
	elif re.match('arate',bdata):
	  c = re.match('arate (.*)', bdata)
	  b.write('arate '+c.group(1))

	elif re.match('^washon.*',bdata):
	  a.write('washon')
	elif re.match('^washoff.*',bdata):
	  a.write('washoff')
	elif re.match('^setwashval',bdata):
	  c = re.match('setwashval (.*)', bdata)
	  print "setting wash val to "+c.group(1)
	  a.write('setwashval '+c.group(1))
	elif re.match('^dryon.*',bdata):
	  a.write('dryon')
	elif re.match('^dryoff.*',bdata):
	  a.write('dryoff')
	elif re.match('^setdryval.*',bdata):
	  c = re.match('setdryval (.*)', bdata)
	  a.write('setdryval '+c.group(1))
	elif re.match('^setpcvval.*',bdata):
	  c = re.match('setpcvval (.*)', bdata)
	  a.write('setpcvval '+c.group(1))
	elif re.match('^setpumpdelay.*',bdata):
	  c = re.match('setpumpdelay (.*)', bdata)
	  a.write('setpumpdelay '+c.group(1))
	elif re.match('^pcvon.*',bdata):
	  a.write('pcvon')
	elif re.match('^pcvoff.*',bdata):
	  a.write('pcvoff')
	elif re.match('^manpcv.*',bdata):
	  a.write('manpcv')
	elif re.match('^feedbackpcv.*',bdata):
	  a.write('feedbackpcv')



	elif re.match('^revivemotors.*',bdata):
	  a.write('revivemotors')
	elif re.match('^killmotors.*',bdata):
	  a.write('killmotors')
	elif re.match('^valveservo input',bdata):
	  print 'valveservo 180'
	  a.write('valveservo 180')
	elif re.match('^valveservo output',bdata):
	  print 'valveservo 100'
	  a.write('valveservo 100')
	elif re.match('^valveservo bypass',bdata):
	  print 'valveservo 60'
	  a.write('valveservo 60')
	elif re.match('^valveservo 180',bdata):
	  print 'valveservo 180'
	  a.write('valveservo 180')
	elif re.match('^valveservo 100',bdata):
	  print 'valveservo 100'
	  a.write('valveservo 100')
	elif re.match('^valveservo 60',bdata):
	  print 'valveservo 60'
	  a.write('valveservo 60')







	elif re.match('^turnon5v.*',bdata):
	  a.write('turnon5v')
	elif re.match('^turnoff5v.*',bdata):
	  a.write('turnoff5v')
	elif re.match('^positionnodeon.*',bdata):
	  os.system('python control_encoderstream.py start')
	elif re.match('^positionnodeoff.*',bdata):
	  os.system('python control_encoderstream.py stop')

	elif re.match('^readsensepin.*',bdata):
	  a.write('readsensepin')
	  rresp = a.readline()
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('^xread.*',bdata):
	  a.write('xread')
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('^yread.*',bdata):
	  a.write('yread')
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('^zread.*',bdata):
	  a.write('zread')
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('^eread.*',bdata):
	  a.write('eread')
	  try:
	 	conn.sendall(str(rresp))
	  except socket.error , msg:
    	 	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	elif re.match('^setlevel.*',bdata):
	   a.write(bdata)

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



