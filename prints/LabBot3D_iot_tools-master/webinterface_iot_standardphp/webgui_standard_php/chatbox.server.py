import socket
import sys,re
import time
import json
import aiml



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
PORT = 8888 # Arbitrary non-privileged port

# load the chatbox
kernel = aiml.Kernel()
kernel.learn("std-startup.xml")
kernel.respond("load aiml b")

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)


#Bind socket to local host and port
try:
    s.bind((HOST, PORT))
except socket.error , msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()
     
 
#Start listening on socket
s.listen(0.1)

 
#Function for handling connections. This will be used to create threads
def clientthread(conn,t):
    #Sending message to connected client
    #infinite loop so that function do not terminate and thread do not end.
    while True:
         
        #Receiving from client
	data = ''
        data = conn.recv(1024)

	if len(data) > 0:
        	reply = 'Command: ' + data
		print reply
		try: 
		  dat = kernel.respond(data)
	        except:
	          dat = "Sorry I have no answer for you"
		print dat
		try:
               	 	conn.sendall(dat)
                except socket.error , msg:
                	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	'''
	else:
        	time.sleep(0.1) 
	'''	
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

