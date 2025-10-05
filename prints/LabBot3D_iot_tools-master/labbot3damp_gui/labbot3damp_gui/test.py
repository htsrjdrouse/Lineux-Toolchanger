import os, re,commands,json,sys

cmd = "ps aux | grep 'caller.labbot3d.subscriber.py' | grep -v grep"
a = commands.getstatusoutput(cmd)[1]
b = re.split('\r|\n', a)
print b[0]
d = re.split('\s+', b[0])
print d
try: 
 os.system('sudo kill '+d[1])
except:
 pass
