import socket
import sys,re
import serial
import time
import callerfunc as cf

from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'


#Connect to Waveform Generator arduino
ser = cf.connect()
print ser.readline()
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
    #conn.send('Waveform generator server:\n') #send only takes string

    #infinite loop so that function do not terminate and thread do not end.
    while True:
         
        #Receiving from client
	data = ''
        data = conn.recv(1024)
	if re.match('REPORT', data):
		dat = cf.report(ser)
		print dat
                time.sleep(0.1)
                try:
                	conn.sendall(dat)
                except socket.error , msg:
                	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	if re.match('^TRIGON', data):
		cf.settrigger(ser,1)
	if re.match('^TRIGOFF', data):
		cf.settrigger(ser,0)
	if re.match('^FIRE', data):
		cf.fire(ser)
	if re.match('^V', data):
		pv = re.match('^V(.*)$', data)
		cf.setvolt(ser,int(pv.group(1)))
	if re.match('^P', data):
		pv = re.match('^P(.*)$', data)
		cf.setpulse(ser,int(pv.group(1)))
	if re.match('^F', data):
		pv = re.match('^F(.*)$', data)
		cf.setfreq(ser,int(pv.group(1)))
	if re.match('^D', data):
		pv = re.match('^D(.*)$', data)
		cf.setdrops(ser,int(pv.group(1)))
	if re.match('^LEDDELAY(.*)', data):
		pv = re.match('^LEDDELAY(.*)$', data)
		cf.setleddelay(ser,int(pv.group(1)))
	if re.match('^LEDTIME(.*)', data):
		pv = re.match('^LEDTIME(.*)$', data)
		cf.setledtime(ser,int(pv.group(1)))
	if re.match('^STROBOSCOPE(.*)', data):
		cf.stroboscope(ser)


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
    t  =''
    start_new_thread(clientthread ,(conn,t))

s.close()
