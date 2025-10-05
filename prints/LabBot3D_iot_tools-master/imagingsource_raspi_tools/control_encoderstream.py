import os, re,commands,json,sys

def writejson(var,dat):
        pcv = open('sockets.json')
        pcvdata = json.load(pcv)
        pcv.close()
        pcvdata[var] = dat
        pcvdatar = json.dumps(pcvdata)
        pcv = open('sockets.json', 'w')
        pcv.write(pcvdatar)
        pcv.close()


def turnon(seg,scmd):
 cmd = "ps aux | grep "+scmd
 a= commands.getstatusoutput(cmd)[1]
 if re.match('^.*sudo python '+scmd, a):
  cmd = "ps aux | grep "+scmd
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

  print re.sub('_.*', '', msg)
  writejson('publisher',re.sub('_.*', '', msg))
 else:
  if re.match('^.*py', scmd):
   os.system('sudo python encoderstream.node/'+scmd+' > /dev/null &')
  elif re.match('^.*js', scmd):
   os.system('sudo node encoderstream.node/'+scmd+' > /dev/null &')
  cmd = "ps aux | grep "+scmd
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

def turnoff(scmd):
 cmd = "ps aux | grep "+scmd
 a= commands.getstatusoutput(cmd)[1]
 b = re.split('\r|\n', a)
 msg = ''
 for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

 print re.sub('_.*', '', msg)
 os.system('sudo kill '+re.sub('_.*', '', msg))
 writejson('socket',0)



act = sys.argv[1]
if act == 'start':
 msg = turnon('publisher','encoder.publisher.py')
 msg = turnon('ennoder','index.js')

else:
  turnoff('encoder.publisher.py')
  turnoff('index.js')
