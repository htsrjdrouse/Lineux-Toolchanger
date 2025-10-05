import re,sys,os,json
import operator,time


def istherearetraction(poscmds,epos):
  res = {}
  le = poscmds[epos]['E']
  c = 1
  i = 0
  while c > 0:
    i = i + 1
    cc = poscmds[epos-i]
    if 'E' in cc:
      ne = cc['E']
      c = 0
  if ne > le:
    res['maxe'] = ne
    res['retraction'] = le
  else:
    res['maxe'] = le
    res['retraction'] = 0
  return res

#la['stepvolume'] = poscmds[len(poscmds)-2]['E']
def getthelaste(poscmds):
   c = 1
   i = 0
   while c > 0:
    i = i + 1
    cc = poscmds[len(poscmds)-i]
    if 'E' in cc:
      c = 0
   return len(poscmds)-i
 


def lineanalyze(a,setjson):
	b = []
	E = 0
	X = 0
	Y = 0
	Z = 0
	F = 0
	Xs = []
	Ys = []
	Zs = []
        la = {}	
	tim = 0
        smoothiesend = []
	poscmds = []
	ct = 0
	for i in a:
	    dt = {}
	    i = re.sub("\n|\r", "", i)
	    #G1 F1800.000 E1.00000
	    if re.match('^.*F.*', i):
	     df = re.match('^.*F(.*)$', i)
	     abf = re.sub(' .*', '', df.group(1))
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
		  abe = re.sub(' .*', '', d.group(1))
		  pe = float(abe)
		  dt['diffe'] = abs(E-pe)
		  E = pe
		  dt['E'] = pe
	    	if re.match('^.*X', i):
		  dx = re.match('^.*X(.*)', i)
		  abx = re.sub(' .*', '', dx.group(1))
		  px = float(abx)
		  Xs.append(px)
		  dt['diffx'] = abs(X-px)
		  X = px
		  dt['X'] = px
	    	if re.match('^.*Y', i):
		  dy = re.match('^.*Y(.*)', i)
		  aby = re.sub(' .*', '', dy.group(1))
		  py = float(aby)
		  Ys.append(py)
		  dt['diffy'] = abs(Y-py)
		  Y = py
		  dt['Y'] = py
	    	if re.match('^.*Z', i):
		  dz = re.match('^.*Z(.*)', i)
		  abz = re.sub(' .*', '', dz.group(1))
		  pz = float(abz)
		  Zs.append(pz)
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
		tim = tim + dt['time']
		smoothiesend.append('ser.write("'+dt['cmd']+'\\r\\n")')
	        poscmds.append(dt)
	la['smoothiesend'] = smoothiesend
        la['positioncmds'] = poscmds	
        laste = getthelaste(poscmds)
        res = istherearetraction(poscmds,laste)
	la['retraction'] = res['retraction']
	la['stepvolume'] = res['maxe']
	#print poscmds
	#print poscmds[len(poscmds)-2]
	'''
	 Here you have to have a if condition
	 this is used to calcuate the volume but it depends on whether
	 there is a retraction before proceeding to the next layer. 
	 This is always the case actually. So if there is a retraction then 
	 we have to identify with another if condition. If there is not then 
  	 the last E value determines the volume and there is no retraction. 
	 If there is a retraction then you have to scan the lines above until
	 you find the last line.  
	'''
	'''
        this is the old way
	tta = poscmds[len(poscmds)-3:len(poscmds)]
	for ji in tta:
	 print ji
	la['stepvolume'] = poscmds[len(poscmds)-2]['E']
	'''
	la['time'] = str(int(tim)+1)
	#['E']
	#print "time.delay("+str(int(tim)+1)+")"
	'''
	print poscmds[0]
	print poscmds[1]
	print poscmds[2]
	print poscmds[3]
	print poscmds[4]
	print poscmds[50]
	print poscmds[51]
	print poscmds[52]
	'''
	#print "ser.close()"
	la['minx'] = min(Xs)
	la['miny'] = min(Ys)
	la['maxx'] = max(Xs)
	la['maxy'] = max(Ys)
	la['z'] = min(Zs)
	return la
	

f = open(sys.argv[1])

#Get the lines numbers of the different z heights
ct = 0 
layers = []
layerdict = {}
lines = []







for i in f:
  dd = {}
  ct = ct + 1
  i = re.sub('\n|\r', '', i)
  lines.append(i)
  if re.match('^G1.*Z', i):
   dd['layer']=i
   dd['line']=ct
   layers.append(dd)


#Now get the specific lines these different z heights
layerdict['layers'] = layers
ct = 0
lineslayer = []
dd = {}



#{"M92":"250","speed":"100","extrusionvol":"100","originx":"100","originy":"100","originz":"60","retractionvol":"100"}
settings = open('adjustgcode.json')
setjson = json.load(settings)
dd['M92'] = setjson['M92']
dd['speed'] = setjson['speed']
dd['extrusionvol'] = setjson['extrusionvol']
dd['retractionvol'] = setjson['retractionvol']
dd['originx'] = setjson['originx']
dd['originy'] = setjson['originy']
dd['originz'] = setjson['originz']



for i in layers:
 if (ct+1) < len(layers):
  bg = int(layers[ct]['line']) - 2
  ed = int(layers[ct+1]['line']) - 1
  lineslayer.append(lines[bg:ed])
 ct = ct + 1

dd['lineslayer'] = lineslayer



#print len(lineslayer)

dd['stepvolume'] = []
dd['time'] = []
dd['retraction'] =[]
mnx = []
mny = []
mxx = []
mxy = []
mz = []
for i in range(0,len(lineslayer)):
 la = lineanalyze(lineslayer[i],setjson)
 mnx.append(la['minx'])
 mny.append(la['miny'])
 mxx.append(la['maxx'])
 mxy.append(la['maxy'])
 mz.append(la['z'])
 dd['smoothiesend'] = la['smoothiesend']
 dd['stepvolume'].append(la['stepvolume'])
 dd['time'].append(la['time'])
 dd['retraction'].append(la['retraction'])

dd['minx'] = min(mnx)
dd['miny'] = min(mny)
dd['maxx'] = max(mxx)
dd['maxy'] = max(mxy)
dd['minz'] = min(mz)
dd['maxz'] = max(mz)
dd['minxry'] = mnx
dd['minyry'] = mny
dd['maxxry'] = mxx
dd['maxyry'] = mxy
dd['zry'] = mz


fn = re.split('\/', sys.argv[1])
aa = open('jsondata/'+fn[1]+'.json', 'w')
aa.write(json.dumps(dd))
aa.close()

#Now analyze each layer to get things like time and volume



'''
print lineslayer[2][0]
print lineslayer[2][1]
print lineslayer[2][2]
print lineslayer[2][len(lineslayer[2])-1]
'''

