import os, re,commands,json,time


def helpinfo():
  help = """
   startcameratrigger() - starts the camera trigger. This calls dmk22trigger.sh
   checktriggerstatus() - checks to see if the trigger script is on, it returns an array of PIDs (there should be 3 in list), the first one is the one you want. If inactive then there should be 2 PIDs
   killcameratrigger() - kills the camera trigger script
   startcamerastream() - starts the webcamera stream
   stopcamerastream() - stops the webcamera stream
   startwebserver() - just starts the webserver not the camera, you have to run this first
   checkwebserverstatus() - checks to see if the webserver is running, it returns an array of PIDS (there should be 3 in list), the first one is the one you want. If inactive then there should be 2 PIDs.
   startwebandcamera() - starts both the webserver and camera stream 
   stopwebandcamera() - stops both the webserver and camera stream 
   checkcamerastreamstatus() - checks the camera stream status, it returns an array of PIDS (there should be 3 in list), the first one is the one you want. If inactive then there should be 2 PIDs.
   killcamerastream() - kills the camera stream, you still have to kill the webserver
   killwebserver() - kills the webserver
  """
  return help






def startcameratrigger():
  os.system('sudo ./dmk22trigger.sh > /dev/null &')

def checktriggerstatus():
  cmd = "ps aux | grep 'gst-launch'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = 'dmk gstream_'
  pids = []
  for i in b:
     d = re.split('\s+', i)
     msg = msg + d[1] + '_'
     pids.append(d[1])
  return pids


def killcameratrigger():
  pids = checktriggerstatus()
  os.system('sudo kill '+str(pids[0]))


def startwebandcamera():
  startwebserver()
  startcamerastream()

def stopwebandcamera():
  killwebserver()
  killcamerastream()

def stopcamerastream():
  pids = checkcamerastreamstatus()
  os.system('sudo kill '+str(pids[0]))


def startwebserver():
   os.system('sudo python LabBot3D/server3.py > /dev/null &')


def checkwebserverstatus():
  cmd = "ps aux | grep 'server3.py'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  #root      2108  0.0  0.0   1896   388 ?        S    16:08   0:00 sh -c { /home/pi/jrk.controller -s; } 2>&1
  msg = ''
  msg = msg + 'wgsi_'
  pids = []
  for i in b:
    d = re.split('\s+', i)
    msg = msg+ d[1] +'_'
    pids.append(d[1])
  return pids



def startcamerastream():
 os.system('sudo /home/pi/LabBot3D/dmk22_web.sh > /dev/null &')


def checkcamerastreamstatus():
  cmd = "ps aux | grep 'dmk22_web.sh'"
  a= commands.getstatusoutput(cmd)[1]
  b = re.split('\r|\n', a)
  msg = ''
  msg = msg + 'wgsi_'
  pids = []
  for i in b:
    d = re.split('\s+', i)
    msg = msg+ d[1] +'_'
    pids.append(d[1])
  return pids

def killcamerastream():
  pids = checkcamerastreamstatus()
  os.system('sudo kill '+str(pids[0]))

def killwebserver():
  pids = checkwebserverstatus()
  os.system('sudo kill '+str(pids[0]))




