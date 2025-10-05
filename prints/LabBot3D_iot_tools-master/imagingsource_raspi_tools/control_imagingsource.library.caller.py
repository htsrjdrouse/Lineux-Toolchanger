import os, re,commands,json,sys


def checksocketstatus():
  cmd = "ps aux | grep 'imagingsource.library.caller.py'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  pids = []
  for i in b:
     d = re.split('\s+', i)
     msg = msg + d[1] + '_'
     pids.append(d[1])
  return pids


act = sys.argv[1]

if act == 'start':
  pids = checksocketstatus()
  if len(pids) > 4: 
    print len(pids)
    pass
  else: 
    os.system('sudo python LabBot3D/imagingsource.library.caller.py &')
elif act == 'stop':
  pids = checksocketstatus()
  os.system('sudo kill '+str(pids[0]))


