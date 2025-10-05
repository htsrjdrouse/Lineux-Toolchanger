import serial
import telnetlib
import re
import json
import paho.mqtt.client as mqtt
from subprocess import Popen, PIPE
import time
import operator
import os



def runeachmacrocmd(cmd):
  sim = 0
  if len(cmd)>0:
   gettimeandwritetaskmanager(cmd)
   if re.match("^G1",cmd):
    gss = re.split("_", cmd)
    gcodecmd = gss[0]
    tme = gss[1]
    if sim == 0:
     sersmoothie.write(gcodecmd+"\r\n")
     time.sleep(float(tme))
     gg =sersmoothie.readlines()
     print gcodecmd
     print tme
     print gg
    else:
     print gcodecmd
     print tme
   if re.match("^G28",cmd):
    gss = re.split("_", cmd)
    gcodecmd = gss[0]
    tme = gss[1]
    if sim == 0:
     sersmoothie.write(gcodecmd+"\r\n")
     time.sleep(float(tme))
     gg =sersmoothie.readlines()
     print gcodecmd
     print tme
     print gg
    else:
     print gcodecmd
     print tme
   if re.match("^M114",cmd):
    if sim == 0:
     gg = smoothiegetposition()
     time.sleep(1)
     print cmd
     print "1"
     print gg
    else:
     print cmd
     print "1"
   if re.match("^linact--home",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("ehoming\n")
     time.sleep(float(tme))
     print "linact--home"
     print tme
    else:
     print "linact--home"
     print tme
   if re.match("^linact--down",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("eforward\n")
     time.sleep(float(tme))
     print "linact--down"
     print tme
    else:
     print "linact--down"
     print tme
   if re.match("^linact--up",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("ebackward\n")
     time.sleep(float(tme))
     print "linact--up"
     print tme
    else:
     print "linact--up"
     print tme
   if re.match("^linact--steps",cmd):
    aa=re.match("linact--steps_(.*)_(.*)", cmd)
    steps = aa.group(1)
    tme = aa.group(2)
    if sim == 0:
     sersteppers.write("esteps "+steps+"\n")
     time.sleep(float(tme))
     print "esteps "+steps
     print tme
    else:
     print "esteps "+steps
     print tme
    #linactinfo()
   if re.match("^linact--rate",cmd):
    aa=re.match("linact--rate_(.*)_(.*)", cmd)
    rate = aa.group(1)
    tme = aa.group(2)
    if sim == 0:
     print "erate "+rate
     print "timedelay "+tme
    else:
     print "erate "+rate
     print "timedelay "+tme


#here begin running macro
def runmacro():
   coordlog = {}
   coordlog['X'] =[]
   coordlog['Y'] =[]
   coordlog['Z'] =[]
   coordlog['E'] =[]
   writeschedularjson(coordlog)
   taskjob = readtaskjobjson()
   reformatmacro = gcodesplitter(taskjob['data'][str(taskjob['track'])]) 
   macroready = putmacrolinestogether(reformatmacro)
   #print macroready
   for i in macroready:
    runeachmacrocmd(i)


def gcodesplitter(gcr):
 #print "gcodesplitter called"
 coordlog = readschedularjson()
 #print "heres the coordlog"
 #print coordlog
 gtba = []
 ba = []
 bba = []
 tba = []
 fl = 0
 for i in gcr:
  if re.match('^G1', i):
   #print i
   try:
    cc = re.split('_', i)
    ci = cc[0]
    ti = cc[1]
   except:
    ti = 0
   coord = jogcoordparser(ci)
   #print "heres the coord"
   #print coord
   if 'X' in coord:
    coordlog['X'].append(coord['X']) 
   if 'Y' in coord:
    coordlog['Y'].append(coord['Y']) 
   if 'Z' in coord:
    coordlog['Z'].append(coord['Z']) 
   if 'E' in coord:
    coordlog['E'].append(coord['E']) 
   writeschedularjson(coordlog)
   gtba.append(i)
   fl = 1
  else:
   fl = 0
  if fl == 1:
   bba.append(i)
  if fl == 0:
   if len(bba)>0:
    tmln = tmecalc(bba)	
    bba = []
    tba.append(tmln)
   tba.append(i)
  if i == gcr[len(gcr)-1]:
   if len(bba)>0 and re.match('^G1', i):
    tmln = tmecalc(bba)	
    tba.append(tmln)
 reformatmacro = tba
 return reformatmacro


def putmacrolinestogether(reformatmacro):
 #print "putmacrolinestogether"
 macrorunready = []
 for i in reformatmacro:
  if isinstance(i, list):
   for j in i:
    macrorunready.append(j)
  else:
   macrorunready.append(i)
 #print macrorunready
 return macrorunready

def tmecalc(gcodebatch):	
	#print "tmecalc called"
 	mesg = readnxjson()
 	coordlog = readschedularjson()
        #print "heres the coordlog called in tmecalc"
        #print coordlog
	try:
	 X = coordlog['X'][len(coordlog['X'])-1]
	except:
	 X = mesg['currcoord']['X']
	try:
	 Y = coordlog['Y'][len(coordlog['Y'])-1]
	except:
	 Y = mesg['currcoord']['Y']
	try:
	 Z = coordlog['Z'][len(coordlog['Z'])-1]
	except:
	 Z = mesg['currcoord']['Z']
	try:
	 E = coordlog['E'][len(coordlog['E'])-1]
	except:
	 E = mesg['currcoord']['E']
	tmln = []
	b = []
	tim = 0
	poscmds = []
	ct = 0
	for i in gcodebatch:
	    #print "gcodebatch"
	    #print i
	    i = re.sub("\n|\r", "", i)
	    dt = {}
	    #G1 F1800.000 E1.00000
	    #here I need to have a conditional if to separate non gcodes from gcodes
	    if re.match('^G1', i):
	     if re.match("^.*_", i):
	      #print "well it matchs"
	      cc = re.split("_", i)
	      ci = cc[0]
              tt = cc[1]
	     else:
	      ci = i
	      tt = 0
	     i = ci
	     #print ci
	     if re.match('^.*F.*', i):
	      df = re.match('^.*F(.*)$', i)
	      abf = re.sub('[ |X|x|Y|y|Z|z|E|e].*', '', df.group(1))
	      pf = float(abf)
	      if pf > 0:
	       F = pf
	     if re.match('^.*[Z|X|Y|E]', i):
	        dt['F'] = F
		ct = ct + 1
		dt['ct'] = ct
	  	pe = 0
		px = 0
		py = 0
		pz = 0
	    	if re.match('^.*E', i):
		  d = re.match('^.*E(.*)', i)
		  abe = re.sub('[ |X|x|Y|y|Z|z|F|f].*', '', d.group(1))
		  pe = float(abe)
		  dt['diffe'] = abs(E-pe)
		  E = pe
		  dt['E'] = pe
	    	if re.match('^.*X', i):
		  dx = re.match('^.*X(.*)', i)
		  abx = re.sub('[ |E|e|Y|y|Z|z|F|f].*', '', dx.group(1))
		  px = float(abx)
		  dt['diffx'] = abs(X-px)
		  X = px
		  dt['X'] = px
	    	if re.match('^.*Y', i):
		  dy = re.match('^.*Y(.*)', i)
		  aby = re.sub('[ |E|e|X|x|Z|z|F|f].*', '', dy.group(1))
		  py = float(aby)
		  dt['diffy'] = abs(Y-py)
		  Y = py
		  dt['Y'] = py
	    	if re.match('^.*Z', i):
		  dz = re.match('^.*Z(.*)', i)
		  abz = re.sub('[ |E|e|X|x|Y|y|F|f].*', '', dz.group(1))
		  pz = float(abz)
		  dt['diffz'] = abs(Z-pz)
		  Z = pz
		  dt['Z'] = pz
	        dt['cmd'] = i
		comp = {}
		try: 
		  comp['diffx'] = dt['diffx']
		except:
		  pass
		try: 
		  comp['diffy'] = dt['diffy']
		except:
		  pass
		try: 
		  comp['diffz'] = dt['diffz']
		except:
		  pass
		try: 
		  comp['diffe'] = dt['diffe']
		except:
		  pass
		sorted_comp = sorted(comp.items(), key=operator.itemgetter(1))
		dt['maxdiff'] = sorted_comp[int(len(comp)-1)][1]
		if dt['F'] > 0:
		  dt['time'] = (dt['maxdiff'] / dt['F']) * 60
		else: 
		  dt['time'] = 0
		if tt > 0:
		 dt['time'] = float(tt)
		tmln.append(i+"_"+str(dt['time']))
		tim = tim + dt['time']
	        poscmds.append(dt)
	    else:
              tmln.append(i)
	delaytme = int(tim)+1
	return tmln

def writeportjson(ports):
 pcvdatar = json.dumps(ports)
 pcv = open('ports.json','w')
 pcv.write(pcvdatar)
 pcv.close()

def readnxjson():
  pcv = open('nx.imgdataset')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata

def readtaskjobjson():
  pcv = open('taskjob3')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata

def writejson(var,dat):
  pcv = open('nx.imgdataset')
  pcvdata = json.load(pcv)
  pcv.close()
  pcvdata[var]=dat
  pcvdatar = json.dumps(pcvdata)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()

def writeschedularjson(dat):
  pcvdatar = json.dumps(dat)
  pcv = open('schedular.json','w')
  pcv.write(pcvdatar)
  pcv.close()

def readschedularjson():
  pcv = open('schedular.json')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata

def writetaskmanager(mesg):
 pcv = open('tasklogger')
 pcvdata = json.load(pcv)
 pcv.close()
 try: 
  pcvdata['mesg'].append(mesg['mesg'])
  a = pcvdata
 except:
  a = {}
  a['mesg'] = []
  a['mesg'].append(mesg['mesg'])
 pcvdatar = json.dumps(a)
 pcv = open('tasklogger','w')
 pcv.write(pcvdatar)
 pcv.close()

# this parsers the gcode 
def smoothiecoordparser(strr):
 coord = {}
 E = 0
 X = 0
 Y = 0
 Z = 0
 if re.match('^.*X',strr):
  px = re.match('^.*X:(.*)', strr)
  x = re.sub('[ |Y|y|Z|z|F|f|E|e].*', '', px.group(1))
  coord['X'] = float(x)
 if re.match('^.*Y|y',strr):
  py = re.match('^.*Y:(.*)', strr)
  y = re.sub('[ |X|x|Z|z|F|f|E|e].*', '', py.group(1))
  coord['Y'] = float(y)
 if re.match('^.*Z',strr):
  pz = re.match('^.*Z:(.*)', strr)
  z = re.sub('[ |X|x|Y|y|F|f|E|e].*', '', pz.group(1))
  coord['Z'] = float(z)
 if re.match('^.*E',strr):
  pe = re.match('^.*E:(.*)', strr)
  e = re.sub('[ |X|x|Y|y|F|f|].*', '', pe.group(1))
  coord['E'] = float(e)
 return coord


# this parsers the gcode
def jogcoordparser(strr):
 coord = {}
 E = 0
 X = 0
 Y = 0
 Z = 0
 if re.match('^.*X|x',strr):
  px = re.match('^.*[X|x](.*)', strr)
  x = re.sub('[ |Y|y|Z|z|F|f|E|e].*', '', px.group(1))
  coord['X'] = float(x)
 if re.match('^.*Y|y',strr):
  py = re.match('^.*[Y|y](.*)', strr)
  y = re.sub('[ |X|x|Z|z|F|f|E|e].*', '', py.group(1))
  coord['Y'] = float(y)
 if re.match('^.*Z|z',strr):
  pz = re.match('^.*[Z|z](.*)', strr)
  z = re.sub('[ |X|x|Y|y|F|f|E|e].*', '', pz.group(1))
  coord['Z'] = float(z)
 if re.match('^.*E|e',strr):
  pe = re.match('^.*[E|e](.*)', strr)
  e = re.sub('[ |X|x|Y|y|F|f|].*', '', pe.group(1))
  coord['E'] = float(e)
 if re.match('^.*F|f',strr):
  pf = re.match('^.*[F|f](.*)', strr)
  f = re.sub('[ |X|x|Y|y|Z|z|].*', '', pf.group(1))
  coord['F'] = int(f)
 return coord


def coordtimecalc(nxt):
  nxt = jogcoordparser(nxt)
  pcv = readnxjson()
  prv = pcv['currcoord']
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
  try:
   if nxt['F'] > 0:
    f = nxt['F']
  except:
   if compd['cx'] > 0 or compd['cy'] > 0 and compd['cz'] == 0:
    f = pcv['speed']['xyjogfeed']
   if compd['cx'] == 0 or compd['cy'] == 0 and compd['cz'] > 0:
    f = pcv['speed']['zjogfeed']
  sorted_comp = sorted(compd.items(), key=operator.itemgetter(1))
  maxdiff = sorted_comp[int(len(compd)-1)][1]
  tme = (maxdiff / f) * 60.
  return tme


def whichone():
 pt = [0,1,2]
 ports = {}
 for i in pt:
  sera = serial.Serial('/dev/ttyACM'+str(i), 9600, timeout=0.5)
  sera.write("info\n")
  resp =  sera.readline()
  if re.match("conveyer_linearactuator.*", resp):
   ports['steppers'] = 'ttyACM'+str(i)
  elif re.match("wash_.*", resp):
   ports['microfluidic'] = 'ttyACM'+str(i)
  else: 
   ports['smoothie'] = 'ttyACM'+str(i)
 return ports

def smoothiegetposition():
 sersmoothie.write("M114\r\n")
 result = sersmoothie.readlines()
 for i in result:
  if re.match('^.*C:.*X:.*', i):
   coord =  smoothiecoordparser(i)
 mesg = 'X'+str(coord['X']) +' Y'+str(coord['Y'])+' Z'+str(coord['Z'])+' E'+str(coord['E'])
 gcmd = 'G1 '+mesg
 writejson("currcoord",coord)  
 writejson("smoothielastcommand",gcmd)  
 return mesg

def smoothiehoming(mesg):
   #print mesg
   sersmoothie.write(mesg+"\r\n")
   resp = sersmoothie.readlines()
   flh = "Homing "
   if re.match("^.*[X|x].*", mesg):
    flh = flh + "X "
   if re.match("^.*[Y|y].*", mesg):
    flh = flh + "Y "
   if re.match("^.*[Z|z].*", mesg):
    flh = flh + "Z "
   gettimeandwritetaskmanager(flh)
   return resp

def smoothiezeroing(mesg):
   sersmoothie.write(mesg+"\r\n")
   flh = "Zeroing "
   resp = sersmoothie.readlines()
   if re.match("^.*[X|x].*", mesg):
    flh = flh + "X "
   if re.match("^.*[Y|y].*", mesg):
    flh = flh + "Y "
   if re.match("^.*[Z|z].*", mesg):
    flh = flh + "Z "
   if re.match("^.*[E|e].*", mesg):
    flh = flh + "E "
   gettimeandwritetaskmanager(flh)
   aa = sersmoothie.readlines()
   return aa

def smoothiejog(mesg,tme):
   sersmoothie.write(mesg+"\r\n")
   time.sleep(tme)
   aa = sersmoothie.readlines()
   return aa
def smoothierevive():
   sersmoothie.write("M999\r\n")
   resp = sersmoothie.readlines()
   return resp
  





def linacthome():
  #print "linacthome is getting called"
  sersteppers.write("ehoming")
  nxdat = readnxjson()
  nxdat['linact']['position'] = 0
  pcvdatar = json.dumps(nxdat)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()

def linactdown():
  sersteppers.write("eforward")
  nxdat = readnxjson()
  nxdat['linact']['position'] = nxdat['linact']['position'] + int(nxdat['linact']['steps'])
  pcvdatar = json.dumps(nxdat)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()

def linactup():
  sersteppers.write("ebackward")
  nxdat = readnxjson()
  nxdat['linact']['position'] = nxdat['linact']['position'] - int(nxdat['linact']['steps'])
  pcvdatar = json.dumps(nxdat)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()

def linactinfo():
  sersteppers.write("einfo\n")
  info = sersteppers.readlines()
  info = info[0]
  #E - Steps:1000,Steprate:500,Stepcount:0,Endstopstatus:1
  a = re.match("E - Steps:(.*),Steprate:(.*),Stepcount:(.*),Endstopstatus:(.*)\n", info)
  #"linact": {"steprate": "1618", "position": 0, "steps": "1727"
  nxdat = readnxjson()
  nxdat['linact']['steps'] = a.group(1)
  nxdat['linact']['steprate'] = a.group(2)
  nxdat['linact']['position'] = a.group(3)
  pcvdatar = json.dumps(nxdat)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()
  return info

def linactstepsandrate(lact):
  gg = re.split("_", lact)
  steps = gg[0]
  rate = gg[1]
  sersteppers.write("esteps "+steps+"\n")
  time.sleep(0.5)
  sersteppers.write("erate "+rate+"\n")
  time.sleep(0.5)
  nxdat = readnxjson()
  nxdat['linact']['steprate'] = rate
  nxdat['linact']['steps'] = steps
  pcvdatar = json.dumps(nxdat)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()


def on_connect(client, userdata, flags, rc):
  #print("Connected with result code "+str(rc))
  client.subscribe("labbot3d_1_control")

def gettimeandwritetaskmanager(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  aa['mesg'] = mesg + ' -- ' +tts
  writetaskmanager(aa)
  return tts

def backup_pcvdata():
  pcvdata = readnxjson()
  try:
   if pcvdata['smoothielastcommand']:
    os.system('cp nx.imgdataset back.nx.imgdataset')
  except:
    os.system('cp back.nx.imgdataset nx.imgdataset')

def on_message(client, userdata, msg):
  mesg =  msg.payload.decode()
  print mesg
  gettimeandwritetaskmanager(mesg)
  backup_pcvdata()
  #print mesg
  if mesg == "M114":
   saa = smoothiegetposition()
   print saa
   gettimeandwritetaskmanager(saa)
  if re.match("^G1.*", mesg):
   #print "got it"
   tme = coordtimecalc(mesg)
   rr = smoothiejog(mesg,tme)
   print rr
   gettimeandwritetaskmanager("Finished moving to "+mesg)
  if re.match("G28.*",mesg):
   rr = smoothiehoming(mesg)
   print rr
  if re.match("G92.*",mesg):
   rr = smoothiezeroing(mesg)
   print rr
  if re.match("M999",mesg):
   rr = smoothierevive()
   print rr
  if re.match("^run ", mesg):
   #print "running macro "+mesg
   runmacro()
  if re.match("^linact", mesg):
   #print "linact called"
   resp = re.split("--", mesg)
   linac = resp[0]
   lact = resp[1]
   if lact == "home":
    linacthome()
   if lact == "down":
    linactdown()
   if lact == "up":
    linactup()
   if lact == "info":
    info = linactinfo()
    gettimeandwritetaskmanager(info)
   if re.match("stepsandrate .*",lact):
    llact = re.split(" ", lact)
    linactstepsandrate(llact[1])	
  if mesg == "Hello world!":
   print "got it!"


ports =  whichone()
writeportjson(ports)

gettimeandwritetaskmanager("System in process of opening serial ports")
#smoothie connection
sersmoothie = serial.Serial('/dev/'+ports['smoothie'], 115200, timeout=0.5)
time.sleep(1)
a = sersmoothie.readlines()

#microfludic connection
sermicrofluidic = serial.Serial('/dev/'+ports['microfluidic'], 9600, timeout=0.5)
time.sleep(1)
a = sermicrofluidic.readlines()

#stepper connection
sersteppers = serial.Serial('/dev/'+ports['steppers'], 9600, timeout=0.5)
time.sleep(1)
a = sersteppers.readlines()
gettimeandwritetaskmanager("System is ready")

    
client = mqtt.Client()
client.connect("localhost",1883,0)
client.username_pw_set('smoothie', 'labbot3d')
client.on_connect = on_connect
client.on_message = on_message
client.loop_forever()





