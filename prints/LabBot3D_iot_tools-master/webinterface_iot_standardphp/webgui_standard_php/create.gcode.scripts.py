import json,re,sys

def arraypopl(pp):
 if len(pp) > 0:
  if re.match('^.*,', pp):
   ppp = re.split(',', pp)
  elif re.match('^.*-', pp):
   pppp = re.split('-', pp)
   ppp = []
   for i in range(int(pppp[0]), int(pppp[1])+1):
    ppp.append(i)
  else:
   ppp.append(pp)
 else:
  ppp = []
 return ppp





#dd['extrusionvol'] = setjson['extrusionvol']
def parsegcode(ss,setjson,ct,ssy):
  ss = re.sub('\r|\n', '', ss)
  if re.match('^G1', ss):
   cmd = 'G1'
   if re.match('^.*X',ss):
    xx = re.match('^.*X(.*)',ss) 
    xx.group(1)
    X = float(re.sub(' .*', '', xx.group(1)))-(float(setjson['minx']))+float(setjson['originx'])
    cmd = cmd + ' X'+str(X)
   if re.match('^.*Y',ss):
    yy = re.match('^.*Y(.*)',ss) 
    Y = float(re.sub(' .*', '', yy.group(1)))-(float(setjson['miny']))+float(setjson['originy'])
    cmd = cmd + ' Y'+str(Y)
   if re.match('^.*Z',ss):
    zz = re.match('^.*Z(.*)',ss) 
    Z = float(setjson['originz']) - (float(re.sub(' .*', '', zz.group(1))) - float(setjson['minz']))
    cmd = cmd + ' Z'+str(Z)
   if re.match('^.*E',ss):
    ee = re.match('^.*E(.*)',ss)
    #This needs to be fixed so that I pass the value
    #if ct == len(ssy)-2:
    if (ct == setjson['retraction']) and (setjson['retraction'] > 0):
     E = float(re.sub(' .*', '', ee.group(1)))*(float(setjson['retractionvol'])/100) 
    else:  
     E = float(re.sub(' .*', '', ee.group(1)))*(float(setjson['extrusionvol'])/100)
    cmd = cmd + ' E'+str(E)
   if re.match('^.*F',ss):
    ff = re.match('^.*F(.*)',ss) 
    F = float(re.sub(' .*', '', ff.group(1)))*(float(setjson['speed'])/100)
    cmd = cmd + ' F'+str(F)
  else:
    cmd = ss
  return cmd


fff = open('result.gcode', 'w')

start = 0
ll = ''
tt = ''
vv = ''
pp = ''
try:
 tt = sys.argv[2]
 if (tt == '-h') or (tt == '-help'):
  start = 0
  print "You can pass arguments into this script but it has to be in order\r\n"
  print "   -l : selects the layers you want to print (ie., 1,2,3,4 or 1-5)\r\n"
 elif re.match('-.', tt):
  args = sys.argv[2:len(sys.argv)]
  try: 
   ll = args[args.index('-l')+1]
  except: 
   pass 
  #print ll
  #fff.write(ll)
  try: 
   pp = args[args.index('-p')+1]
  except:
   pass
  #print pp
  #fff.write(pp)
  try: 
   vv = args[args.index('-v')+1]
  except: 
   pass
  #print vv
  #fff.write(pp)
  start = 1
except:
 start = 1

settings = open('jsondata/'+sys.argv[1]+'.json')
setjson = json.load(settings)

vvv = arraypopl(vv)
ppp = arraypopl(pp)

pl = arraypopl(ll)
#print pl
if len(pl)>0:
  layers = []
  for i in pl:
   layers.append(setjson['lineslayer'][int(i)-1])
else: 
  layers = setjson['lineslayer']

#print layers

if start == 1: 
 ctt = 0
 for i in layers:
   ct = 0
   for j in i:
    cmd = parsegcode(j,setjson,ct,i)
    #print 'ser.write("'+cmd+'\\r\\n")<br>'
    fff.write('ser.write("'+cmd+'\\r\\n")<br>')
    ct = ct + 1
   ctt = ctt + 1
   try: 
    ppp.index(str(ctt))
    print "---------------------------------"
    print "-----------TAKE SCAN-----------"
    print "---------------------------------"
   except:
    pass
   try: 
    vvv.index(str(ctt))
    print "---------------------------------"
    print "-----------RELOAD VALVE-----------"
    print "---------------------------------"
   except:
    pass


fff.close()



