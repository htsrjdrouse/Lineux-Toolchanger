import os, re,commands,json

cmd = "ps aux | grep 'gearman'"
a= commands.getstatusoutput(cmd)[1]
b = re.split('\r|\n', a)

msg = ''
msg = msg + 'gearmanpids_'
for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'
	os.system('sudo kill '+str(d[1]))
print msg
