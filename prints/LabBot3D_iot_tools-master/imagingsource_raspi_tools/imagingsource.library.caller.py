import time
import startstopheadcamstream as st
import socket
import sys,re,os
import json
import commands
from subprocess import PIPE, Popen
from thread import *



#b = ser2.readline()
#print b

HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    s.bind((HOST, PORT))
except socket.error , msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()


#Start listening on socket
s.listen(0.1)
print 'Socket now listening'



#Function for handling connections. This will be used to create threads
def clientthread(conn,t):
    while True:
        #Receiving from client
	data = ''
        data = conn.recv(1024)
        reply = 'Command: ' + data
	print reply
	a = data
    	if re.match("help|h|H|Help|HELP", data):
     	  print st.helpinfo()
 	  try:
		conn.sendall("help is printed")
  	  except socket.error , msg:
    		print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    	elif re.match("startcameratrigger", a):
     	  st.startcameratrigger()
    	elif re.match("checktriggerstatus", a):
   	  st.checktriggerstatus()
  	elif re.match("killcameratrigger", a):
   	  st.killcameratrigger()
    	elif re.match("startcamerastream", a):
   	  st.startcamerastream()
    	elif re.match("stopcamerastream", a):
   	  st.stopcamerastream()
    	elif re.match("startwebserver", a):
   	  st.startwebserver()
    	elif re.match("startwebserver", a):
   	  st.startwebserver()
    	elif re.match("startwebandcamera", a):
   	  st.startwebandcamera()
    	elif re.match("stopwebandcamera", a):
   	  st.stopwebandcamera()
    	elif re.match("checkwebserverstatus", a):
   	  pid = st.checkwebserverstatus()
   	  print pid[0]
    	elif re.match("checkcamerastreamstatus", a):
   	  pid = st.checkcamerastreamstatus()
   	  print pid[0]
    	elif re.match("killcamerastream|stopcamerastream", a):
   	  st.killcamerastream()
    	elif re.match("killwebserver|stopwebserver", a):
   	  st.killwebserver()
        else:
                time.sleep(0.1)
        if not data:
            break
    #came out of loop
    conn.close()


#now keep talking with the client
while 1:
    conn, addr = s.accept()
    print 'Connected with ' + addr[0] + ':' + str(addr[1])
    t = '' 
    start_new_thread(clientthread ,(conn,t))
s.close()





