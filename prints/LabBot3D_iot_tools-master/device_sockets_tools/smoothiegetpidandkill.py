import re, os

#root      2857  0.5  1.2  11368  5492 pts/1    S    02:29   0:00 python marlin.telnet.socket.py


os.system("ps aux | grep 'smoothie_socket.py' > pidfile")
pf = open('pidfile')

for i in pf:
	a = re.split('\s+',i)
	print a[1]
	os.system('kill ' +a[1])
