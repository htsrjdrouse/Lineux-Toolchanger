import json
import re, os

#root      2857  0.5  1.2  11368  5492 pts/1    S    02:29   0:00 python marlin.telnet.socket.py

os.system("ps aux | grep 'python move.smoothie.move.py' > pidfile")
pf = open('pidfile')

f = open('imgdataset')
dat = json.load(f)
f.close()



pids = []
for i in pf:
	a = re.split('\s+',i)
	print a[1]
	pids.append(a[1])

dat['smoothiemessage'] = 'There were '+str(len(pids)-2)+' processes killed'
print dat['smoothiemessage']
f = open('imgdataset', 'w')
f.write(json.dumps(dat))
f.close()


for i in pids:
	os.system('kill ' + i)

