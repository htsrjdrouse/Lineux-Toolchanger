import sys
import re
import Image
import numpy as np
from math import ceil
import json

import dropquant as dr





#sudo python dropquant.caller.py imaging/strobimages/1422473098_V110_P90_LD250.jpg 359,118,175,200 6 30 0 sample 36 400 8.04

pimgset = sys.argv[1]
set = sys.argv[2]
mindiam = int(sys.argv[3])
maxdiam = int(sys.argv[4])
uthresh = int(sys.argv[5])
sample = sys.argv[6]
deflectypos = sys.argv[7]
deflectxpos = sys.argv[8]
micronperpixel = sys.argv[9]

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

for i in imgset:
	imgname = i
	img = Image.open(i).convert('L')
	img = img.split()[0]
        ddset =  dr.strobimgprocess(img,set,mindiam,maxdiam,uthresh,imgname,deflectypos,deflectxpos,micronperpixel)
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









#img.save(path+'/'+namer)
#f.write(jdset)
#f.close()
#idf.close()
#print "finished"
'''
{"dataset": [{"dropraw": [{"columncenter": 94, "columndiameter": 7, "deflection": 24.839999999999996, "drops": 0, "image": "strobimages/1422473085_V110_P90_LD250.jpg", "rowcenter": 45, "rowdiameter": 9, "signal": 9.9285714285714288, "speed": 629.28, "volume": 200.96000000000001}, {"columncenter": 95, "columndiameter": 14, "deflection": 33.12, "drops": 1, "image": "strobimages/1422473085_V110_P90_LD250.jpg", "rowcenter": 173, "rowdiameter": 11, "signal": 14.405982905982906, "speed": 1689.12, "volume": 678.24000000000001}], "image": "strobimages/1422473085_V110_P90_LD250.jpg"}, {"dropraw": [{"columncenter": 94, "columndiameter": 10, "deflection": 24.839999999999996, "drops": 0, "image": "strobimages/1422473098_V110_P90_LD250.jpg", "rowcenter": 45, "rowdiameter": 10, "signal": 11.556338028169014, "speed": 629.28, "volume": 392.5}, {"columncenter": 95, "columndiameter": 13, "deflection": 33.12, "drops": 1, "image": "strobimages/1422473098_V110_P90_LD250.jpg", "rowcenter": 173, "rowdiameter": 11, "signal": 13.921739130434782, "speed": 1689.12, "volume": 678.24000000000001}], "image": "strobimages/1422473098_V110_P90_LD250.jpg"}], "sample": "testwater"}

'''





