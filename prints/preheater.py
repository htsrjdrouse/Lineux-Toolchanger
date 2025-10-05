import sys,re
import operator
	

#############function calculate the time for printing 
def tmecalc(a):	
	#a = open('gcode.files/'+filename)
	#a = open(sys.argv[1])
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
	     abf = re.sub('[ |X|x|Y|y|Z|z|E|e].*', '', df.group(1))
   	     abf = re.sub(r'\s*;.*$', '', abf, flags=re.MULTILINE)
	     try: 
	       pf = float(abf)
	       if pf > 0:
	         F = pf
   	     except:
	       pass
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
		  abe = re.sub(r'\s*;.*$', '', abe, flags=re.MULTILINE)
		  try: 	          	
		   pe = float(abe)
		   dt['diffe'] = abs(E-pe)
		   E = pe
		   dt['E'] = pe
		  except:
		   pass
	    	if re.match('^.*X', i):
		  dx = re.match('^.*X(.*)', i)
		  abx = re.sub('[ |E|e|Y|y|Z|z|F|f].*', '', dx.group(1))
		  abx = re.sub(r'\s*;.*$', '', abx, flags=re.MULTILINE)
		  try: 
		   px = float(abx)
		   dt['diffx'] = abs(X-px)
		   X = px
		   dt['X'] = px
		  except:
		   pass
	    	if re.match('^.*Y', i):
		  dy = re.match('^.*Y(.*)', i)
		  aby = re.sub('[ |E|e|X|x|Z|z|F|f].*', '', dy.group(1))
		  aby = re.sub(r'\s*;.*$', '', aby, flags=re.MULTILINE)
 		  try: 
		    py = float(aby)
		    dt['diffy'] = abs(Y-py)
		    Y = py
		    dt['Y'] = py
		  except:
		    pass
	    	if re.match('^.*Z', i):
		  dz = re.match('^.*Z(.*)', i)
		  abz = re.sub('[ |E|e|X|x|Y|y|F|f].*', '', dz.group(1))
		  abz = re.sub(r'\s*;.*$', '', abz, flags=re.MULTILINE)
		  try: 
		    pz = float(abz)
		    dt['diffz'] = abs(Z-pz)
		    Z = pz
		    dt['Z'] = pz
		  except:
		    pass
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
		if len(comp)>0:
		  sorted_comp = sorted(comp.items(), key=operator.itemgetter(1))
		  dt['maxdiff'] = sorted_comp[int(len(comp)-1)][1]
		  if dt['F'] > 0:
		    dt['time'] = (dt['maxdiff'] / dt['F']) * 60.
		    #print("time: " +str(dt['time']))
		    print("line: "+str(ct)+" time: " +str(dt['time']))
		    tim = tim + dt['time']
		  else: 
		    dt['time'] = 0
		    tim = tim + dt['time']
	            poscmds.append(dt)
		    #print(tim)
	
	print int(tim)+1
	'''
	delaytme = int(tim)+1
	print(tim)
	return delaytme
	'''


#############function that groups the coordinates for each toolchange 

def segments(filn):
	ln = []
	ct = 0
	endstart = 0
	toolchangers = []
	for i in filn:
		if re.match(';END_START', i):
			endstart = ct
		if endstart>0 and re.match('^T[0|1]', i):
			toolchangers.append(ct)
		ln.append(i)
		ct = ct+1
	toolchanger_segments = []
	for j in range(0,len(toolchangers)):
		try:
		  #print(ln[toolchangers[j]:toolchangers[j+1]])
		  toolchanger_segments.append((ln[toolchangers[j]:toolchangers[j+1]]))
		except:
		  pass
		#print(j)
 	toolchanger_segments.append(ln[toolchangers[-1]:ct])
	return toolchanger_segments
		

###############################

#open the file
filn = open(sys.argv[1])

#split the parts based on toolchanges in order to calculate the time for printing for each one
toolchanger_segments = segments(filn)

#calculate the time to print each segment
for j in toolchanger_segmentsL
  tmecalc(toolchanger_segments[j])
  

#I need to modify the original gcode file to include a preheating step before the toolchange. I want to have the toolchanger 30 seconds preheat before pickup. Also if the parked tool is resting for less than 45 seconds, do not cool it.



