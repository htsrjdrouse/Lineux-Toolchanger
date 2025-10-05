import gearman
import serial
import time
import telnetlib
import re

#Connect to smoothie
ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0.5)
time.sleep(2)
a = ser.readlines()
print a
#ser.write('\r\n')
#ser.write('version\r\n')




def s1valvechange(gearman_worker, gearman_job):
    tn = telnetlib.Telnet('172.24.1.82', 8887)
    time.sleep(1)
    tn.write(gearman_job.data)
    tt = re.split("_", gearman_job.data)
    time.sleep(int(tt[1]))
    tn.close()
    return gearman_job.data

def task_listener_reverse(gearman_worker, gearman_job):
    print 'Reversing string: ' + gearman_job.data
    return gearman_job.data[::-1]

def getposition(gearman_worker, gearman_job):
    ser.write('M114\r\n')
    #print gearman_job.data
    time.sleep(int(gearman_job.data))
    a = ser.readline()
    return a

def move(gearman_worker, gearman_job):
    ser.write(gearman_job.data+'\r\n')
    tt = re.split("_", gearman_job.data)
    print tt[1]
    time.sleep(int(tt[1]))
    ser.readline()
    return a

def runthefile(gearman_worker, gearman_job):
    print "cmd: gcode.files/"+str(gearman_job.data)
    [filename,tmedelay] = re.split('_', str(gearman_job.data))
    print "opening file: gcode.files/"+filename
    ff = open("gcode.files/"+filename)
    for i in ff:
      i = re.sub('\r|\n', '',i)
      if re.match('/^G|M/', i):
       ser.write(i+'\r\n')
       ser.readline()
      #"hts_s1_valveinput go"
      if re.match('/^hts_s1_valve/', i):
	dd = re.split(" ", i)
        tn = telnetlib.Telnet('172.24.1.82', 8887)
        time.sleep(1)
        tn.write(dd[0])
        time.sleep(1)
        tn.close()
    print "the time delay: "+tmedelay
    time.sleep(float(tmedelay))
    return "runfile "+filename+" finished"


gm_worker = gearman.GearmanWorker(['localhost:4730'])


gm_worker.register_task('reverse', task_listener_reverse)
gm_worker.register_task('M114', getposition)
gm_worker.register_task('move', move)
gm_worker.register_task('s1valve', s1valvechange)
gm_worker.register_task('runfile', runthefile)
gm_worker.work()

