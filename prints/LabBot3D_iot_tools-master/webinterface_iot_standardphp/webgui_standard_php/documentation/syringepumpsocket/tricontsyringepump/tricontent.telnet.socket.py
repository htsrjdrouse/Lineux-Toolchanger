import socket
import sys,re
import serial
import time
import math

from thread import *

 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

t = open('./tricontent.syringe.socket.connect.log','w')

#connect to Tricontinent device
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
    #conn.send('Syringe pump server:\n') #send only takes string


    #infinite loop so that function do not terminate and thread do not end.
    while True:
         
        #Receiving from client
	data = ''
        data = conn.recv(1024)
	bdata = []
	bdata = re.split('_', data)
        reply = 'Command: ' + data
	print reply
	# ------------Report status------------
	if re.match('^Q', data):
		print 'query is called'
		ser.write('/1?29R\r')
		print ser.readline()

	# ------------Initialization------------
	#dead volume command
	#During initializaions, plunger moves upward until it contacts top of the syringe, causing forced stall initialization. Plunger then moves downward 120 full steps then upward 120 minus the <n> specified amount leaving a gap (dead volume, between syringe seal and top of plunger. Small gap designed so that seal does not hit top of the plunger each time syringe moves to home or zero position
	#recommend 10 steps or 12 nanoliters
	#ser.write('/1k10ZR\r')
	if re.match('^I', data):
		print 'Initializing'
		#ser.write('/1k10Z25R\r')
		ser.write('/1k10ZBR\r')
		ser.readline()
		
	# ------------Set valve input position------------
	if re.match('^VI', data):
		ser.write('/1IR\r')
		ser.readline()
	
	# ------------Set valve output position------------
	if re.match('^VO', data):
		ser.write('/1OR\r')
		ser.readline()
	
	# ------------Set valve bypass position------------
	if re.match('^VB', data):
		ser.write('/1BR\r')
		ser.readline()
	
	# ------------Terminate ------------
	if re.match('^T', data):
		ser.write('/1TR\r')
		ser.readline()
	
	
	# ------------Fill line loop -------------------
	# Use this to fill the line WITH THE TIP OFF
	# not finished ...
	if re.match('^F', data):
		fl = re.match('^F(.*)$', data)
		cmd = '/1OA10gv900V1400IA3000OD3000G'+fl.group(1)+'BR\r'
		#ser.write('/1A10gv900V1400IA3000OD3000G'+fl.group(1)+'R\r')
		# really
		ser.write('/1OA1gv900V1400IA3000OD3000G'+fl.group(1)+'BR\r')
		ser.readline()




	# ------------Wash loop -------------------
	if re.match('^W', data):
		fl = re.match('^W(.*)$', data)
		prewashsteprate = fl.group(1)
		washstepratery = re.split('_', prewashsteprate)
		print washstepratery[2]
		dispensevol = int(int(washstepratery[2]) * (3000/250.))
		print dispensevol
		washtime = int(int(washstepratery[0])/2.5)
		steprate = math.ceil(int(washstepratery[1]) * (3000/250))
		accsteprate = int(steprate/1.558)
		steps = washtime * steprate	
		cycles = steps / 3000.
		loopcycles = int(cycles)
		cmd = '/1O'
		cmd = cmd + 'v'+str(int(accsteprate))+'V'+str(int(steprate))+'D'+str(dispensevol) #dispensing part
		cmd = cmd + 'A1gv900V1400'
		#cmd = '/1A1gv900V1400'
		if cycles > 1:
			loopcycles = int(cycles)
			#cmd = cmd + 'IA3000v77V120D3000G'+str(loopcycles)
			cmd = cmd + 'IA3000v'+str(int(accsteprate))+'V'+str(int(steprate))+'D3000G'+str(loopcycles)
		reststeps = int((cycles - loopcycles) * 3000)
		cmd = cmd + 'A1gv900V1400IA'+str(reststeps)+'v'+str(int(accsteprate))+'V'+str(int(steprate))+'OD'+str(reststeps)+'G1BR\r'
		print cmd
		ser.write(cmd)
		ser.readline()


	

	
	# ------------Aspiration and Dispense  -------------------
	if re.match('^v', data):
		data = re.sub('\r|\n', '', data)
		cmd = '/1'+data+'R\r'
		print cmd
		ser.write(cmd)	
		ser.readlines()

	# ------------Set Valve, Aspiration and Dispense  -------------------
	if re.match('^O', data):
		data = re.sub('\r|\n', '', data)
		cmd = '/1'+data+'R\r'
		print cmd
		ser.write(cmd)	
		ser.readlines()




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
