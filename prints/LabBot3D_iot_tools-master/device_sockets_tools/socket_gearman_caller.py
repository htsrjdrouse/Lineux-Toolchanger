import socket
import sys,re
import serial
import time
import gearman
import operator
import tmecalc as te

from thread import *



#X:0.000 Y:0.000 Z:0.000 E:0.000 

def m114parser(strr):
 coord = {}
 aa  =re.match('X:(.*) Y:(.*) Z:(.*) E:(.*)$', strr)
 coord['X']= float(aa.group(1))
 coord['Y']= float(aa.group(2))
 coord['Z']= float(aa.group(3))
 coord['E']= float(aa.group(4))
 return coord



def coordparser(strr):
 coord = {}
 E = 0
 X = 0
 Y = 0
 Z = 0
 F = 0
 print strr
 if re.match('^.*X',strr):
  px = re.match('^.*X(.*)', strr)
  x = re.sub('[ |Y|y|Z|z|F|f|E|e].*', '', px.group(1))
  coord['X'] = float(x)
 if re.match('^.*Y|y',strr):
  py = re.match('^.*Y(.*)', strr)
  y = re.sub('[ |X|x|Z|z|F|f|E|e].*', '', py.group(1))
  coord['Y'] = float(y)
 if re.match('^.*Z',strr):
  pz = re.match('^.*Z(.*)', strr)
  z = re.sub('[ |X|x|Y|y|F|f|E|e].*', '', pz.group(1))
  coord['Z'] = float(z)
 if re.match('^.*E',strr):
  pe = re.match('^.*E(.*)', strr)
  e = re.sub('[ |X|x|Y|y|F|f|].*', '', pe.group(1))
  coord['E'] = float(e)
 if re.match('^.*F',strr):
  pf = re.match('^.*F(.*)', strr)
  f = re.sub('[ |X|x|Y|y|Z|z|E|e].*', '', pf.group(1))
  coord['F'] = float(f)
 return coord


def coordtimecalc(prv,nxt):
  compd = {}
  if 'X' in nxt:
   compd['cx'] = abs(nxt['X'] - prv['X'])
  else: 
   compd['cx'] = 0
  if 'Y' in nxt:
   compd['cy'] = abs(nxt['Y'] - prv['Y'])
  else: 
   compd['cy'] = 0
  if 'Z' in nxt:
   compd['cz'] = abs(nxt['Z'] - prv['Z'])
  else: 
   compd['cz'] = 0
  if 'E' in nxt:
   compd['ce'] = abs(nxt['E'] - prv['E'])
  else: 
   compd['ce'] = 0
  sorted_comp = sorted(compd.items(), key=operator.itemgetter(1))
  maxdiff = sorted_comp[int(len(compd)-1)][1]
  tme = (maxdiff / nxt['F']) * 60.
  return tme


def check_request_status(job_request):
    if job_request.complete:
        #print "Job %s finished!  Result: %s - %s" % (job_request.job.unique, job_request.state, job_request.result)
        res =  "Job %s finished!  Result: %s - %s" % (job_request.job.unique, job_request.state, job_request.result)
    elif job_request.timed_out:
        #print "Job %s timed out!" % job_request.unique
        res =  "Job %s timed out!" % job_request.unique
    elif job_request.state == JOB_UNKNOWN:
        #print "Job %s connection failed!" % job_request.unique
        res = "Job %s connection failed!" % job_request.unique
    return res

gm_client = gearman.GearmanClient(['localhost:4730'])
print "gearman client link established"
 
HOST = ''   # Symbolic name meaning all available interfaces
PORT = 8888 # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

time.sleep(1)

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
        reply = 'Command: ' + bdata
	print reply
	# Smoothie report position
	if re.match('^M114.*',bdata):
	    	completed_job_request = gm_client.submit_job("M114", "1")
		rresp = str(check_request_status(completed_job_request))
		print rresp
		rresp = re.sub('^.*X:', 'X:', rresp)
		rresp =  m114parser(rresp)
		print rresp
		try:
			conn.sendall(str(rresp))
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	if re.match('^M119.*',bdata):
	    	completed_job_request = gm_client.submit_job("M119", "1")
		rresp = str(check_request_status(completed_job_request))
		print rresp
		try:
			conn.sendall(str(rresp))
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]








	#Here is the move which is originally called from the smoothiesocketmove in repstrapfunctionslib.php
	if re.match('^readthedata.*',bdata):
	    	completed_job_request = gm_client.submit_job("readline", "1")
		rresp = str(check_request_status(completed_job_request))
		try:
			conn.sendall(str(rresp))
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	# homing	
	if re.match('^G28.*',bdata):
	    	completed_job_request = gm_client.submit_job("move", bdata+"_"+str(3))
		rresp = str(check_request_status(completed_job_request))
		try:
			conn.sendall('homed')
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	if re.match('P1move .*', bdata):
		print bdata
	    	completed_job_request = gm_client.submit_job("M114", "1")
		rresp = str(check_request_status(completed_job_request))


	if re.match('^G1.*',bdata):
		#print bdata
	    	completed_job_request = gm_client.submit_job("M114", "1")
		rresp = str(check_request_status(completed_job_request))
		rresp = re.sub('^.*X:', 'X:', rresp)
		rresp =  m114parser(rresp)
		coord = coordparser(bdata)
		tme = coordtimecalc(rresp,coord)
	    	completed_job_request = gm_client.submit_job("move", bdata+"_"+str(tme))
	        time.sleep(float(tme))
		rresp = str(check_request_status(completed_job_request))
		#print "I am finished"
		try:
			conn.sendall(bdata)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

	if re.match('^runfile.*',bdata):
	    	completed_job_request = gm_client.submit_job("M114", "1")
		rresp = str(check_request_status(completed_job_request))
		rresp = re.sub('^.*X:', 'X:', rresp)
		rresp =  m114parser(rresp)
		print rresp
		ff = re.match('^runfile (.*)$', bdata)
		filename = ff.group(1)
		fo = open('gcode.files/'+filename)
                fl = 0
		for i in fo:
		 if re.match('^G1.*[X|Y|Z]', i):
		  refline = i
		  break
		coord = coordparser(refline)
		#print refline
		#print coord 
		tme = coordtimecalc(rresp,coord)
		#print tme
		tmedelay =  te.tmecalc(filename)
		#print tmedelay
		print 'total time delay '+str(tme + tmedelay)
	    	completed_job_request = gm_client.submit_job("runfile", filename+"_"+str(tmedelay))
		time.sleep(tme+tmedelay)
	    	#completed_job_request = gm_client.submit_job("readline", "1")
		try:
			conn.sendall(filename)
		except socket.error , msg:
    			print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]

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



