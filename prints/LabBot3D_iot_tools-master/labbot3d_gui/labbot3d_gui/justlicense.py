from subprocess import Popen, PIPE
import re
import serial
import json 
import paho.mqtt.client as mqtt 
import time 
import operator
import os
import justlicense




def readpumpsensor(sermicrofluidic):
 sermicrofluidic.write("readtemp\n\r")
 sens = sermicrofluidic.readline()
 return sens


def pumps(sermicrofluidic, cmd):
 print "pumps called"
 print cmd
 sermicrofluidic.write(cmd+"\n\r")

def turnon5v_valve(sermicrofluidic):
 sermicrofluidic.write("turnon5v\n\r")
 
def turnoff5v_valve(sermicrofluidic):
 sermicrofluidic.write("turnoff5v\n\r")


def pumpscaller(sermicrofluidic,cmd):
  sermicrofluidic.write(cmd+"\n\r")


def tvalve(valve, valvepos, sermicrofluidic):
 microfl = open('microfluidics.json')
 microfljson = json.load(microfl)
 microfl.close()
 analogwrite =  microfljson['valve'][int(valve)][valvepos]
 if (int(valve) == 0):
  print "valveservo "+str(analogwrite)+"\n\r"
  sermicrofluidic.write("valveservo "+str(analogwrite)+"\n\r")
 microfl = open('microfluidics.json','w')
 microfldatar = json.dumps(microfljson)
 microfl.write(microfldatar)
 microfl.close()
 time.sleep(2)


#def valveposmacro():
def valveposmacro():
 print "jammin" 

def valvepos(valve, valvepos,sermicrofluidic):
 microfl = open('microfluidics.json')
 microfljson = json.load(microfl)
 microfl.close()
 analogwrite =  microfljson['valve'][int(valve)][valvepos]
 if (int(valve) == 0):
  print "valveservo "+str(analogwrite)+"\n\r"
  sermicrofluidic.write("valveservo "+str(analogwrite)+"\n\r")
 microfl = open('microfluidics.json','w')
 microfldatar = json.dumps(microfljson)
 microfl.write(microfldatar)
 microfl.close()

def upublisher(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  #print "can it print the mesg?"
  #print mesg
  #print "yes it can"
  aa['mesg'] = mesg + ' -- ' +tts
  cmd = "mosquitto_pub  -t 'labbot3d_1_control_track' -u smoothie -P labbot3d -d -m '"+aa['mesg']+"'" 
  os.system(cmd) 





def changeimgprefix(nname):
 print "changeimgprefix is called, its "+nname
 pcv = open('imaging.json')
 print "works here ok"
 pcvdata = json.load(pcv)
 pcvdata['imgprefix'] = nname
 pcv.close()
 print "...  and even works here"
 print "here is the new imgprefix: "+pcvdata['imgprefix']
 pcv = open('imaging.json','w')
 upublisher("new image prefix: "+nname)
 pcvdatar = json.dumps(pcvdata)
 pcv.write(pcvdatar)
 pcv.close()


def changepumptime(nname):
 microfl = open('microfluidics.json')
 jsonmicrofl = json.load(microfl)
 jsonmicrofl['washpcvtime'] = nname
 microfl.close()
 microfl = open('microfluidics.json','w')
 microdatar = json.dumps(jsonmicrofl)
 microfl.write(microdatar)
 microfl.close()

def gettimeandwritetaskmanager(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  aa['mesg'] = mesg + ' -- ' +tts
  writetaskmanager(aa)
  return tts

def grabwebstreamframe():
 print "grabbing pic"
 pcv = open('imaging.json')
 pcvdata = json.load(pcv)
 pcv.close()
 ts = time.gmtime()
 tts = time.strftime("%Y-%m-%d-%H-%M-%S", ts)
 cmd = "sudo /usr/src/ffmpeg-4.0.2-armhf-32bit-static/ffmpeg -f MJPEG -y -i http://"+pcvdata['imaging']+":"+pcvdata['imagingport']+"/stream.mjpg -r 1 -vframes 1 -q:v 1 imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg"
 print cmd
 pcvdata['lastimg'] = "imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg"
 upublisher(pcvdata['lastimg'] + 'saved')
 pcvdatar = json.dumps(pcvdata)
 print pcvdata['lastimg']
 pcv = open('imaging.json','w')
 pcv.write(pcvdatar)
 pcv.close()
 os.system(cmd)
 #gettimeandwritetaskmanager("snapped imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg")
 upublisher("snapped imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg")

def writejson(var,dat):
  pcv = open('nx.imgdataset')
  pcvdata = json.load(pcv)
  pcv.close()
  pcvdata[var]=dat
  pcvdatar = json.dumps(pcvdata)
  pcv = open('nx.imgdataset','w')
  pcv.write(pcvdatar)
  pcv.close()




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


#runeachmacrocmd(i,sersmoothie,sersteppers,sermicrofluidic)

def runeachmacrocmd(cmd,sersmoothie,sermicrofluidic,serencoder,client):
  sim = 0
  print cmd
  if len(cmd)>0:
   if re.match("^G1",cmd):
    gss = re.split("_", cmd)
    gcodecmd = gss[0]
    tme = gss[1]
    if float(tme) < 0.2:
      tme = str(0.2)
    if sim == 0:
     #sersmoothie.readlines()
     sersmoothie.write(gcodecmd+"\r\n")
     time.sleep(float(tme))
     gg =sersmoothie.readlines()
     upublisher(cmd)
     #print gcodecmd
     #print tme
     #print gg
    else:
     print gcodecmd
     print tme
   if re.match("^G28",cmd):
    gss = re.split("_", cmd)
    gcodecmd = gss[0]
    tme = gss[1]
    print "sim is"+str(sim)
    if sim == 0:
     print "this is called"
     #sersmoothie.readlines()
     sersmoothie.write(gcodecmd+"\r\n")
     time.sleep(float(tme))
     gg =sersmoothie.readlines()
     upublisher(cmd)
     #print gcodecmd
     #print tme
     #print gg
    else:
     print gcodecmd
     print tme
   if re.match("^M114",cmd):
    upublisher(cmd)
    if sim == 0:
     gg = smoothiegetposition(sersmoothie)
     upublisher(gg)
     time.sleep(0.2)
     saa = readencoders(serencoder)
     upublisher("X: "+saa['x'] + " Y: "+saa['y'])
     time.sleep(0.2)
    else:
     print cmd
     print "1"
   if re.match("^valve.*", cmd):
    #upublisher(cmd)
    ccmd = "mosquitto_pub -h '172.24.1.115' -t 'test-mosquitto' -m '"+cmd+"'" 
    print ccmd
    os.system(ccmd) 
    time.sleep(1)
    upublisher(ccmd)
   if re.match("^washpcvon.*", cmd):
    pumps(sermicrofluidic, cmd)
    upublisher(cmd)
   if re.match("^wasteon.*", cmd):
    pumps(sermicrofluidic, 'dryon')
    upublisher(cmd)
   if re.match("^wasteoff.*", cmd):
    pumps(sermicrofluidic, 'dryoff')
    upublisher(cmd)
   if re.match("^washon.*", cmd):
    pumps(sermicrofluidic, 'washon')
    upublisher(cmd)
   if re.match("^washoff.*", cmd):
    pumps(sermicrofluidic, 'washoff')
    upublisher(cmd)
   if re.match("^snap",cmd):
     grabwebstreamframe()
     upublisher("snap!")
   if re.match("^renamesnap",cmd):
     aa=re.match("renamesnap (.*)", cmd)
     #print aa.group(1)
     changeimgprefix(aa.group(1))
   if re.match("^//",cmd):
     upublisher(cmd)
'''
   if re.match("^linact--home",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("ehoming\n")
     time.sleep(float(tme))
     print "linact--home"
     print tme
     upublisher("linact--home")
    else:
     print "linact--home"
     print tme
   if re.match("^linact--down",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    print "this part works"
    if sim == 0:
     grabwebstreamframe()


   if re.match("^linact--home",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("ehoming\n")
     time.sleep(float(tme))
     print "linact--home"
     print tme
     upublisher("linact--home")
    else:
     print "linact--home"
     print tme
   if re.match("^linact--down",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    print "this part works"
    if sim == 0:


   if re.match("^linact--home",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    if sim == 0:
     sersteppers.write("ehoming\n")
     time.sleep(float(tme))
     print "linact--home"
     print tme
     upublisher("linact--home")
    else:
     print "linact--home"
     print tme
   if re.match("^linact--down",cmd):
    gss = re.split("_", cmd)
    tme = gss[1]
    print "this part works"
    if sim == 0:
     sersteppers.write("eforward\n")
     time.sleep(float(tme))
     print "linact--down"
     print tme
     upublisher("linact--down")
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
     upublisher("linact--up")
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
     upublisher("esteps "+steps)
    else:
     print "esteps "+steps
     print tme
    #linactinfo()
   if re.match("^linact--rate",cmd):
    aa=re.match("linact--rate_(.*)_(.*)", cmd)
    rate = aa.group(1)
    tme = aa.group(2)
    if sim == 0:
     sersteppers.write("erate "+rate+"\n")
     time.sleep(float(tme))
     print "erate "+rate
     print "timedelay "+tme
     upublisher("erate "+rate)
    else:
     print "erate "+rate
     print "timedelay "+tme
   #gettimeandwritetaskmanager(cmd)
   #publisher(client,cmd)
'''


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





def readschedularjson():
  pcv = open('schedular.json')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata


def gcodesplitter(gcr):
 coordlog = readschedularjson()
 gtba = []
 ba = []
 bba = []
 tba = []
 fl = 0
 for i in gcr:
  if re.match('^G', i):
  #if re.match('^G1', i):
   try:
    cc = re.split('_', i)
    ci = cc[0]
    ti = cc[1]
   except:
    ti = 0
   coord = jogcoordparser(ci)
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
   #if len(bba)>0 and re.match('^G1', i):
   if len(bba)>0 and re.match('^G', i):
    tmln = tmecalc(bba)	
    tba.append(tmln)
 reformatmacro = tba
 return reformatmacro


def readtaskjobjson():
  pcv = open('taskjob3')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata

def writeschedularjson(dat):
  pcvdatar = json.dumps(dat)
  pcv = open('schedular.json','w')
  pcv.write(pcvdatar)
  pcv.close()



   #justlicense.runmacro(sersmoothie,sersteppers,sermicrofluidic)
def runmacro(sersmoothie,sermicrofluidic,serencoder,client):
   coordlog = {}
   coordlog['X'] =[]
   coordlog['Y'] =[]
   coordlog['Z'] =[]
   coordlog['E'] =[]
   writeschedularjson(coordlog)
   taskjob = readtaskjobjson()
   reformatmacro = gcodesplitter(taskjob['data'][str(taskjob['track'])]) 
   macroready = putmacrolinestogether(reformatmacro)
   for i in macroready:
    runeachmacrocmd(i,sersmoothie,sermicrofluidic,serencoder,client)



def smoothierevive(sersmoothie,client):
   sersmoothie.write("M999\r\n")
   resp = sersmoothie.readlines()
   upublisher("M999")
   return resp

def setstepspermm(sersmoothie,client,cmd):
   sersmoothie.write(cmd+"\r\n")
   resp = sersmoothie.readlines()
   upublisher("set steps per mm: "+cmd)
   time.sleep(1)
   sersmoothie.write("M503\r\n")
   resp = sersmoothie.readlines()
   upublisher(resp[2])




def smoothiezeroing(mesg,sersmoothie,client):
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
   #gettimeandwritetaskmanager(flh)
   upublisher(cmd)
   aa = sersmoothie.readlines()
   return aa



def smoothiehoming(mesg,sersmoothie,client):
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
   #gettimeandwritetaskmanager(flh)
   upublisher(cmd)
   return resp



def smoothiejog(mesg,tme,sersmoothie):
   print "smoothiejog called"
   print mesg
   sersmoothie.readlines()
   sersmoothie.write(mesg+"\r\n")
   time.sleep(tme)
   aa = sersmoothie.readlines()
   return aa


def readnxjson():
  pcv = open('nx.imgdataset')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata


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
  try: 
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
  except:
   tme = 1
  return tme


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


 
def readencoders(serencoder):
 serencoder.write("xyread\n\r")
 time.sleep(1)
 ttm = serencoder.readline()
 print ttm
 ttm = re.sub("\r\n", "", ttm)
 x = re.sub("x", "", re.split("_", ttm)[0])
 y = re.sub("y", "", re.split("_", ttm)[1])
 gg = {}
 gg['x'] = x
 gg['y'] = y
 return gg 




def smoothiegetposition(sersmoothie):
 #print "this is called"
 sersmoothie.write("M114\r\n")
 result = sersmoothie.readlines()
 print result
 for i in result:
  if re.match('^.*C:.*X:.*', i):
   coord =  smoothiecoordparser(i)
 mesg = 'X'+str(coord['X']) +' Y'+str(coord['Y'])+' Z'+str(coord['Z'])+' E'+str(coord['E'])
 gcmd = 'G1 '+mesg
 writejson("currcoord",coord)  
 writejson("smoothielastcommand",gcmd)  
 return mesg




def writeportjson(ports):
 ports['license'] = getmacaddr()
 pcvdatar = json.dumps(ports)
 pcv = open('ports.json','w')
 pcv.write(pcvdatar)
 pcv.close()



def getmacaddr():
 p1 = Popen(["ifconfig"], stdout=PIPE)
 g =  p1.communicate()
 gg = re.split("\n", g[0])
 for i in gg:
  if re.match('^eth0.*', i):
   ab = re.match("^.*HWaddr (.*)$", i)
   addr = ab.group(1)
 #if re.match('b8:27:eb:16:48:da', addr):
 if re.match('b8:27:eb:6f:c7:56', addr):
  status = "yes"
 else:
  status = "no"
 return status


