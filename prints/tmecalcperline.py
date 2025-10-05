import sys,re
import operator
	

#def tmecalc(filename):	
def tmecalc():	
	tmln = []
	#a = open('gcode.files/'+filename)
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
		#here I need to have a conditional if to separate non gcodes from gcodes
		if re.match('^G1', i):
			if re.match('^.*F.*', i):
				df = re.match('^.*F(.*)$', i)
				abf = re.sub('[ |X|x|Y|y|Z|z|E|e].*', '', df.group(1))
				abf = re.sub(';.*','',abf)
				print(abf)
				pf = float(abf)
				if pf > 0:
					F = pf
			if re.match('^.*[Z|X|Y|E]', i):
				dt['F'] = int(F)
				ct = ct + 1
				dt['ct'] = ct
				pe = 0
				px = 0
				py = 0
				pz = 0
				if re.match('^.*E', i):
					d = re.match('^.*E(.*)', i)
					abe = re.sub('[ |X|x|Y|y|Z|z|F|f].*', '', d.group(1))
					abe = re.sub(' ;.*', '', abe)
					abe = re.sub(';.*', '', abe)
					#print(abe)
					#print(d.group(1))
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
					abx = re.sub(' ;.*', '', abx)
					abx = re.sub(';.*', '', abx)
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
					aby = re.sub(' ;.*', '', aby)
					aby = re.sub(';.*', '', aby)
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
					abz = re.sub(' ;.*', '', abz)
					abz = re.sub(';.*', '', abz)
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
				print(comp)
				if len(comp) > 0:
					sorted_comp = sorted(comp.items(), key=operator.itemgetter(1))
					dt['maxdiff'] = sorted_comp[int(len(comp)-1)][1]	
					if dt['F'] > 0:
						dt['time'] = (dt['maxdiff'] / dt['F']) * 60.
					else:
						dt['time'] = 0	
					tmln.append(i+"_"+str(dt['time']))
					print(tmln)
					tim = tim + dt['time']
					poscmds.append(dt)
		return tmln
	'''
	    else:
              tmln.append(i)
	      print "non gcode"
	delaytme = int(tim)+1
	'''	
tmln = tmecalc()	
