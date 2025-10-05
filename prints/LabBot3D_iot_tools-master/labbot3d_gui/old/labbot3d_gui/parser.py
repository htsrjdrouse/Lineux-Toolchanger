import re
import json
import operator
import serial



def tmecalc(gcodebatch):	
	tmln = []
	b = []
 	mesg = readnxjson()
 	lastpos = mesg['currcoord']
	X = lastpos['X']
	Y = lastpos['Y']
	Z = lastpos['Z']
	E = lastpos['E']
	tim = 0
	poscmds = []
	ct = -1
	for i in gcodebatch:
	    ct = ct + 1
	    dt = {}
	    i = re.sub("\n|\r", "", i)
	    #G1 F1800.000 E1.00000
	    #here I need to have a conditional if to separate non gcodes from gcodes
	    if re.match('^G1', i):
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
		  dt['time'] = (dt['maxdiff'] / dt['F']) * 60.
		else: 
		  dt['time'] = 0
		tmln.append(i+"_"+str(dt['time']))
		tim = tim + dt['time']
	        poscmds.append(dt)
	    else:
              tmln.append(i)
	      print "non gcode"
	delaytme = int(tim)+1
	return tmln


def readtaskjobjson():
  pcv = open('taskjob3')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata


def readnxjson():
  pcv = open('nx.imgdataset')
  pcvdata = json.load(pcv)
  pcv.close()
  return pcvdata


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
  #"speed":{"xyjogfeed":6000,"extruderfeed":600,"zjogfeed":200}
   if compd['cx'] > 0 or compd['cy'] > 0 and compd['cz'] == 0:
    f = pcv['speed']['xyjogfeed']
   if compd['cx'] == 0 or compd['cy'] == 0 and compd['cz'] > 0:
    f = pcv['speed']['zjogfeed']
  sorted_comp = sorted(compd.items(), key=operator.itemgetter(1))
  maxdiff = sorted_comp[int(len(compd)-1)][1]
  tme = (maxdiff / f) * 60.
  print tme
  return tme

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


def gcodesplitter(gcr):
 ba = []
 bba = []
 tba = []
 fl = 0
 gcr = taskjob['data'][taskjob['track']]
 for i in gcr:
  if re.match('^G1', i):
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
 macrorunready = []
 for i in reformatmacro:
  if isinstance(i, list):
   for j in i:
    macrorunready.append(j)
  else:
   macrorunready.append(i)
 return macrorunready



pcvdata =readnxjson()

try:
 if pcvdata['smoothielastcommand']:
  print "yes"
except:
  print "nada"

print pcvdata

#strr = "G1X25"
#coordtimecalc(strr)
#strr = jogcoordparser(strr)
'''
taskjob = readtaskjobjson()
reformatmacro = gcodesplitter(taskjob['data'][taskjob['track']])
print reformatmacro
macrorunready = putmacrolinestogether(reformatmacro)
for i in macrorunready:
 print i
'''
#reformatmacro = gcodesplitter(taskjob['data'][47])



#sstr = "G1X10Y23Z12F1000"
#coord = jogcoordparser(sstr)
#print coord
#if 'X' in coord:
# print "yes"
#print taskjob['data'][str(taskjob['track'])]
#print reformatmacro

'''
macrorunready = putmacrolinestogether(reformatmacro)

for i in macrorunready:
 print i

mesg = "run runthtis"
if re.match("^run ", mesg):
 print mesg
'''
