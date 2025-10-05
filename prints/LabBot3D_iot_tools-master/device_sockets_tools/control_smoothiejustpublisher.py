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
cmd = "ps aux | grep 'smoothie.publisher.py'"
a= commands.getstatusoutput(cmd)[1]
b = re.split('\r|\n', a)
msg = ''
for i in b:
        d = re.split('\s+', i)
        msg = msg+ d[1] +'_'

print re.sub('_.*', '', msg)
os.system('sudo kill '+re.sub('_.*', '', msg))

