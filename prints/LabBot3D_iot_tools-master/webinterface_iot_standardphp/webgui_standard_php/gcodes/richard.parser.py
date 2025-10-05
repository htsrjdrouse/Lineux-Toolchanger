import sys,re
import operator

print "import serial,time"
print "ser = serial.Serial('COM3',115200,timeout=0.5)"


a = open(sys.argv[1])


b = []
E = 0
X = 0
Y = 0
Z = 0
F = 0

tim = 0
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
	  dt['diffx'] = abs(X-px)
	  X = px
	  dt['X'] = px
    	if re.match('^.*Y', i):
	  dy = re.match('^.*Y(.*)', i)
	  aby = re.sub(' .*', '', dy.group(1))
	  py = float(aby)
	  dt['diffy'] = abs(Y-py)
	  Y = py
	  dt['Y'] = py
    	if re.match('^.*Z', i):
	  dz = re.match('^.*Z(.*)', i)
	  abz = re.sub(' .*', '', dz.group(1))
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
	tim = tim + dt['time']
	print 'ser.write("'+dt['cmd']+'\\r\\n")'
        poscmds.append(dt)



print "time.delay("+str(int(tim)+1)+")"
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
