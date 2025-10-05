import re
import json
import os


def check(cmd):
  if re.match("^linact--steps",cmd):
   aa=re.match("linact--steps_(.*)_(.*)", cmd)
   steps = aa.group(1)
   tt = aa.group(2)
   print "esteps "+steps
   print "timedelay "+tt
   #sersteppers.write("esteps "+steps+"\n")
  if re.match("^linact--rate",cmd):
   aa=re.match('linact--rate_(.*)_(.*)', cmd)
   rate = aa.group(1)
   tt = aa.group(2)
   print "erate "+rate
   print "timedelay "+tt
   #sersteppers.write("esteps "+steps+"\n")


os.system('cp nx.imgdataset back.nx.imgdataset')

pcv = open('tasklogger')
pcvdata = json.load(pcv)
pcv.close()



for i in pcvdata['mesg']:
 print i
#sstr = "linact--rate_2000_2"
#check(sstr)

