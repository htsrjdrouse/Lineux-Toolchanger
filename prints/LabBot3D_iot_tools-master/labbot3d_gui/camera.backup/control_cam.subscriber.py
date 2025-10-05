import os, re,commands,json,sys

cmd = "ps aux | grep 'cam.subscriber.py'"
a = commands.getstatusoutput(cmd)[1]
b = re.split('\r|\n', a)
msg = ''
for i in b:
   d = re.split('\s+', i)
   msg = msg+ d[1] +'_'
print re.sub('_.*', '', msg)
os.system('sudo kill '+re.sub('_.*', '', msg))
