import re, os

#root      2857  0.5  1.2  11368  5492 pts/1    S    02:29   0:00 python marlin.telnet.socket.py
#gearman   2037  0.0  0.2  54732  1104 ?        Ssl  01:10   0:04 /usr/sbin/gearmand --pid-file=/var/run/gearman/gearmand.pid --user=gearman --daemon --log-file=/var/log/gearman-job-server/gearman.log --listen=127.0.0.1
#www-data  3096  0.0  1.5  21940  6952 ?        S    18:07   0:00 php smoothie.gearman.client.list.php

os.system("ps aux | grep 'smoothie.gearman.client.list.php' > pidfile")
pf = open('pidfile')

for i in pf:
	a = re.split('\s+',i)
	#print a[1]
	os.system('kill ' +a[1])
