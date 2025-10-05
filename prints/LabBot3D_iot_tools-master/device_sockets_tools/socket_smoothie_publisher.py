import socket
import sys,re,os,json
import serial
import time
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

	if re.match('^M114.*',bdata):
	  os.system("python smoothie.publisher.py 'M114'")

	elif re.match('^M999.*',bdata):
	  os.system("python smoothie.publisher.py 'M999'")

        elif re.match('G28 X0', bdata):
	  os.system("python smoothie.publisher.py 'G28 X0'")

        elif re.match('G28 Y0', bdata):
	  os.system("python smoothie.publisher.py 'G28 Y0'")

        elif re.match('G30', bdata):
	  os.system("python smoothie.publisher.py 'G30'")

        elif re.match('G28 Z0', bdata):
	  os.system("python smoothie.publisher.py 'G28 Z0'")

	elif re.match('^G1.*',bdata):
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^runfile.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^valveservo.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^washon.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^washoff.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^dryon.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^dryoff.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^turnon5v.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^turnoff5v.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^manpcv.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^feedbackpcv.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^pcvon.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^pcvoff.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^aforward.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^abackward.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^asteps.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^asteprate.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

	elif re.match('^ahoming.*',bdata):
	        print "python smoothie.publisher.py '"+bdata+"'"
	        os.system("python smoothie.publisher.py '"+bdata+"'")

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



