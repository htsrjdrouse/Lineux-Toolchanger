import os, re,commands,json,sys

def writejson(var,dat):
        pcv = open('/var/www/html/smoothiedriver/sockets.json')
        pcvdata = json.load(pcv)
        pcv.close()
        pcvdata[var] = dat
        pcvdatar = json.dumps(pcvdata)
        pcv = open('/var/www/html/smoothiedriver/sockets.json', 'w')
        pcv.write(pcvdatar)
        pcv.close()




act = sys.argv[1]
if act == 'start':
 cmd = "ps aux | grep 'socket_smoothie_publisher.py'"
 a= commands.getstatusoutput(cmd)[1]
 if re.match('^.*sudo python socket_smoothie_publisher.py', a):
  cmd = "ps aux | grep 'socket_smoothie_publisher.py'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

  print re.sub('_.*', '', msg)
  writejson('socket',re.sub('_.*', '', msg))
 else:
  os.system('sudo python socket_smoothie_publisher.py > /dev/null &')
  cmd = "ps aux | grep 'socket_smoothie_publisher.py'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

  print re.sub('_.*', '', msg)
  writejson('smoothiepublisher',re.sub('_.*', '', msg))
else:
 cmd = "ps aux | grep 'socket_smoothie_publisher.py'"
 a= commands.getstatusoutput(cmd)[1]
 b = re.split('\r|\n', a)
 msg = ''
 for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

 print re.sub('_.*', '', msg)
 os.system('sudo kill '+re.sub('_.*', '', msg))
 writejson('smoothiepublisher',0)

