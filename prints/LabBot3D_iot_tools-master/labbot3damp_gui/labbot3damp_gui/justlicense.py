from subprocess import Popen, PIPE
import re
import serial
import json 
import paho.mqtt.client as mqtt 
import time 
import operator
import os
import justlicense
import dropquant as dr
import Image
import numpy as np
from math import ceil


def analyzedroplets(cmd):
 cc = re.split(" ", cmd)
 pimgset = cc[1]
 set = cc[2]
 mindiam = int(cc[3])
 maxdiam = int(cc[4])
 uthresh = int(cc[5])
 sample = cc[6]
 deflectypos = cc[7]
 deflectxpos = cc[8]
 micronperpixel = cc[9]
 imgset = re.split(',', pimgset)
 dddset = []
 dictset = {}
 totalvolume = []
 drops = []
 minspeed = []
 maxspeed = []
 avgspeed = []
 avgdeflection = []
 avgsignal = []
 print cc
 print "testing"
 print imgset
 for i in imgset:
        print "works"
	imgname = i
	img = Image.open(i).convert('L')
	img = img.split()[0]
        ddset =  dr.strobimgprocess(img,set,mindiam,maxdiam,uthresh,imgname,deflectypos,deflectxpos,micronperpixel)
        print ddset
	dddset.append(ddset)
        if ddset['dropcalc']['drops'] > 0:
	  totalvolume.append(ddset['dropcalc']['totalvolume'])
	  drops.append(ddset['dropcalc']['drops'])
	  minspeed.append(ddset['dropcalc']['minspeed'])
	  maxspeed.append(ddset['dropcalc']['maxspeed'])
	  avgspeed.append(ddset['dropcalc']['avgspeed'])
  	  avgdeflection.append(ddset['dropcalc']['avgdeflection'])
	  avgsignal.append(ddset['dropcalc']['avgsignal'])
 	else:
	  totalvolume.append(0)
	  drops.append(0)
	  minspeed.append(0)
	  maxspeed.append(0)
	  avgspeed.append(0)
  	  avgdeflection.append(0)
	  avgsignal.append(0)
 avgdddset = {}
 avgdddset['avgvolume'] = np.mean(totalvolume)
 avgdddset['stdvolume'] = np.std(totalvolume)
 avgdddset['avgdrops'] = np.mean(drops)
 avgdddset['stddrops'] = np.std(drops)
 avgdddset['avgminspeed'] = np.mean(minspeed)
 avgdddset['stdminspeed'] = np.std(minspeed)
 avgdddset['avgmaxspeed'] = np.mean(maxspeed)
 avgdddset['stdmaxspeed'] = np.std(maxspeed)
 avgdddset['avgavgspeed'] = np.mean(avgspeed)
 avgdddset['stdavgspeed'] = np.std(avgspeed)
 avgdddset['avgdeflection'] = np.mean(avgdeflection)
 avgdddset['stddeflection'] = np.std(avgdeflection)
 dictset['sample'] = sample
 dictset['dataset'] = dddset
 dictset['calcdataset'] = avgdddset
 jdset = json.dumps(dictset, sort_keys=True)
 jjn = re.split('\/', imgname)
 namer = jjn[len(jjn)-1]
 path = jjn[0:(len(jjn)-2)]
 print jdset
 dropres = open('/var/www/html/labbot3damp_gui/droplet.results.json', 'w')
 dropresdatar = json.dumps(jdset)
 dropres.write(dropresdatar)
 dropres.close()
 















def readpumpsensor(sermicrofluidic):
 sermicrofluidic.write("readtemp\n\r")
 sens = sermicrofluidic.readline()
 return sens


def pumps(sermicrofluidic, cmd):
 print "pumps called"
 print cmd
 sermicrofluidic.write(cmd+"\n\r")

def turnon5v_valve(sermicrofluidic):
 sermicrofluidic.write("turnon5v\n\r")
 
def turnoff5v_valve(sermicrofluidic):
 sermicrofluidic.write("turnoff5v\n\r")


def pumpscaller(sermicrofluidic,cmd):
  sermicrofluidic.write(cmd+"\n\r")


def tvalve(valve, valvepos, sermicrofluidic):
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json')
 microfljson = json.load(microfl)
 microfl.close()
 analogwrite =  microfljson['valve'][int(valve)][valvepos]
 if (int(valve) == 0):
  print "valveservo "+str(analogwrite)+"\n\r"
  sermicrofluidic.write("valveservo "+str(analogwrite)+"\n\r")
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json','w')
 microfldatar = json.dumps(microfljson)
 microfl.write(microfldatar)
 microfl.close()
 time.sleep(2)


def valvepos(valve, valvepos,sermicrofluidic):
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json')
 microfljson = json.load(microfl)
 microfl.close()
 analogwrite =  microfljson['valve'][int(valve)][valvepos]
 if (int(valve) == 0):
  print "valveservo "+str(analogwrite)+"\n\r"
  sermicrofluidic.write("valveservo "+str(analogwrite)+"\n\r")
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json','w')
 microfldatar = json.dumps(microfljson)
 microfl.write(microfldatar)
 microfl.close()

def upublisher(mesg):
  ipadd = open('/home/pi/config.json')
  ipaddjson = json.load(ipadd)
  ipadd.close()
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  #print "can it print the mesg?"
  #print mesg
  #print "yes it can"
  aa['mesg'] = mesg + ' -- ' +tts
  cmd = "mosquitto_pub  -t "+ipaddjson['topic']+"track -u "+ipaddjson['username']+" -P "+ipaddjson['password']+" -d -m '"+aa['mesg']+"'" 
  #cmd = "mosquitto_pub  -t 'labbot3d_1_control_track' -u ampmicrofl -P labbot3d -d -m '"+aa['mesg']+"'" 
  os.system(cmd) 


def changeimgprefix(nname):
 print "changeimgprefix is called, its "+nname
 pcv = open('/var/www/html/labbot3damp_gui/imaging.json')
 print "works here ok"
 pcvdata = json.load(pcv)
 pcvdata['imgprefix'] = nname
 pcv.close()
 print "...  and even works here"
 print "here is the new imgprefix: "+pcvdata['imgprefix']
 pcv = open('/var/www/html/labbot3damp_gui/imaging.json','w')
 upublisher("new image prefix: "+nname)
 pcvdatar = json.dumps(pcvdata)
 pcv.write(pcvdatar)
 pcv.close()


def changepumptime(nname):
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json')
 jsonmicrofl = json.load(microfl)
 jsonmicrofl['washpcvtime'] = nname
 microfl.close()
 microfl = open('/var/www/html/labbot3damp_gui/microfluidics.json','w')
 microdatar = json.dumps(jsonmicrofl)
 microfl.write(microdatar)
 microfl.close()


def writetaskmanager(mesg):
 pcv = open('/var/www/html/labbot3damp_gui/tasklogger')
 pcvdata = json.load(pcv)
 pcv.close()
 try: 
  pcvdata['mesg'].append(mesg['mesg'])
  a = pcvdata
 except:
  a = {}
  a['mesg'] = []
  a['mesg'].append(mesg['mesg'])
 pcvdatar = json.dumps(a)
 pcv = open('/var/www/html/labbot3damp_gui/tasklogger','w')
 pcv.write(pcvdatar)
 pcv.close()



def gettimeandwritetaskmanager(mesg):
  aa = {}
  ts = time.gmtime()
  tts = time.strftime("%Y-%m-%d %H:%M:%S", ts)
  aa['mesg'] = mesg + ' -- ' +tts
  writetaskmanager(aa)
  return tts

def grabwebstreamframe():
 print "grabbing pic"
 pcv = open('/var/www/html/labbot3damp_gui/imaging.json')
 pcvdata = json.load(pcv)
 pcv.close()
 ts = time.gmtime()
 tts = time.strftime("%Y-%m-%d-%H-%M-%S", ts)
 cmd = "sudo ffmpeg -f MJPEG -y -i http://"+pcvdata['imaging']+":"+pcvdata['imagingport']+"/stream.mjpg -r 1 -vframes 1 -q:v 1 /var/www/html/labbot3damp_gui/imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg"
 #cmd = "sudo /usr/src/ffmpeg-4.0.2-armhf-32bit-static/ffmpeg -f MJPEG -y -i http://"+pcvdata['imaging']+":"+pcvdata['imagingport']+"/stream.mjpg -r 1 -vframes 1 -q:v 1 /var/www/html/labbot3damp_gui/imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg"
 print cmd
 pcvdata['lastimg'] = "imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg"
 upublisher(pcvdata['lastimg'] + 'saved')
 pcvdatar = json.dumps(pcvdata)
 print pcvdata['lastimg']
 pcv = open('/var/www/html/labbot3damp_gui/imaging.json','w')
 pcv.write(pcvdatar)
 pcv.close()
 os.system(cmd)
 #gettimeandwritetaskmanager("snapped imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg")
 upublisher("snapped imaging/"+pcvdata['selectedfolder']+"/"+pcvdata['imgprefix']+"_"+tts+".jpg")



def writeportjson(ports):
 ports['license'] = getmacaddr()
 pcvdatar = json.dumps(ports)
 pcv = open('/var/www/html/labbot3damp_gui/ports.json','w')
 pcv.write(pcvdatar)
 pcv.close()



def getmacaddr():
 p1 = Popen(["ifconfig"], stdout=PIPE)
 g =  p1.communicate()
 gg = re.split("\n", g[0])
 addr = re.sub('^.*ether ', '', re.sub('  txqueuelen.*', '', gg[1]))
 if re.match('b8:27:eb:6b:80:ad', addr):
  status = "yes"
 else:
  status = "no"
 return status

