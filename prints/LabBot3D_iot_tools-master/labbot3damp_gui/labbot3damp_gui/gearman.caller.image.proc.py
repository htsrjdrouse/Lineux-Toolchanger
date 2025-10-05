import sys
import Image
import re
import numpy as np
from math import ceil
import json


def dropquant(adat,rowcenter,columncenter,rowdiameter,columndiameter,threshold):
	brow = rowcenter - ((rowdiameter+4/2))
	erow = rowcenter + ((rowdiameter+4/2))
	bcol = columncenter - ((columndiameter+4/2))
	ecol = columncenter + ((columndiameter+4/2))
	pixelsig = adat[brow:erow,bcol:ecol]
	threshsig = np.where(pixelsig > threshold)
	avgsig = 0
	if (len(threshsig[0]) > 0):
		avgsig = np.mean(threshsig)
	return avgsig



def strobimgprocess(img,set,mindiam,maxdiam,uthresh,imgname,deflectypos,deflectxpos,micronperpixel):
	dtaset = re.split(',', set)
	aax =int(dtaset[0])
	aay =int(dtaset[1])
	wdim =int(dtaset[2])
	ldim =int(dtaset[3])
	#draw = ImageDraw.Draw(img)
	box = (aax, aay, aax+wdim, aay+ldim)
	area = img.crop(box)
	szarea= area.size
	#draw = ImageDraw.Draw(area)
	pixels = list(area.getdata())
	dat = np.array(pixels)
	ex = aax+wdim
	ey = aay+ldim
	adat = np.reshape(dat,(szarea[1],szarea[0]))
	if uthresh > 0:
		threshold = uthresh
	else:
		maxsig=[np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][1],np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][2]]
		threshold = maxsig[0]
		#print maxsig
	sigs = np.where(adat > threshold)
	row = sigs[0]
	row = np.array(row)
	row = np.sort(row)
	uniqrow = np.unique(row)
	drops = []
	drop = []
	for i in range(0,len(uniqrow)):
	  if uniqrow[i] < np.max(uniqrow):
		if uniqrow[i+1] <= uniqrow[i] + 4:
		 drop.append(uniqrow[i])
		else:
		 drop.append(uniqrow[i])
		 drops.append(drop)
		 drop = []
 	  if uniqrow[i] == np.max(uniqrow):
		 drop.append(uniqrow[i])
  		 drops.append(drop)

	dropsdata = []
	dropdata = []
	for i in range(0,len(drops)):
	  droprow = drops[i]
	  ad = {}
	  ad['drop'] = i+1
	  ad['droprows'] = []
	  ad['dropcols'] = []

	  for j in range(0,len(sigs[0])):
	    if (sigs[0][j] >= drops[i][0]) and (sigs[0][j] <= drops[i][len(drops[i])-1]):
	     ad['droprows'].append(sigs[0][j])
	     ad['dropcols'].append(sigs[1][j])

	  ad['rowdiam'] = np.max(np.bincount(ad['droprows']))
	  ad['rowcent'] = int(ceil(np.median(np.where(np.bincount(ad['droprows']) > 0 )[0])))
	  ad['coldiam'] = np.max(np.bincount(ad['dropcols']))
	  ad['colcent'] = int(ceil(np.median(np.where(np.bincount(ad['dropcols']) > 0 )[0])))
	  ad['avgrad'] = (ad['rowdiam'] + ad['coldiam'])/4
	  ad['volume'] = (4/3)*3.14*(ad['avgrad']*ad['avgrad']*ad['avgrad'])
	  #aled = re.match('^.*_LD(.*).jpg', imgname)
	  aled = re.match('^.*_LD(.*).jpg', imgname)
	  leddelay = int(re.sub('\..*', '', aled.group(1)))
	  ad['speed'] = (aay+ad['rowcent'] - int(deflectypos)*float(micronperpixel)/leddelay)
	  ad['deflection'] = (aax+ad['colcent'] - int(deflectxpos))*float(micronperpixel)
	  #draw.point((ad['rowcent'],ad['colcent']), ("red"))
	  dropsdata.append(ad)

	dset = []
	a = 0
	volume = []
	deflection = []
	speed = []
	signal = []
	for i in dropsdata:
		datr = {}
		datr['image'] = imgname
		datr['rowdiameter'] = i['rowdiam']
		datr['rowcenter'] = i['rowcent']
		datr['columndiameter'] = i['coldiam']
		datr['columncenter'] = i['colcent']
		datr['volume'] = i['volume']
		datr['speed'] = i['speed']
		datr['deflection'] = i['deflection']
		if (((datr['rowdiameter'] >= mindiam) or (datr['columndiameter'] >= mindiam)) and ((datr['rowdiameter'] <= maxdiam) or (datr['columndiameter'] <= maxdiam))):
			a = a + 1
			datr['drops'] = a
			datr['signal'] = dropquant(adat,(datr['rowcenter']),(datr['columncenter']),datr['rowdiameter'],datr['columndiameter'],threshold)
			dset.append(datr)
			signal.append(datr['signal'])
			deflection.append(i['deflection'])
			volume.append(i['volume'])
			speed.append(i['speed'])

	ddset = {}
	ddset['image'] = imgname
	ddset['dropraw'] = dset
	dropcalc = {}
	dropcalc['threshold'] = threshold
	if (a > 0):
	  dropcalc['totalvolume'] = np.sum(volume)
	  dropcalc['drops'] = datr['drops']
	  dropcalc['minspeed'] = np.min(speed)
	  dropcalc['maxspeed'] = np.max(speed)
	  dropcalc['avgspeed'] = np.mean(speed)
	  dropcalc['avgdeflection'] = np.mean(deflection)
	  dropcalc['avgsignal'] = np.mean(signal)
	  dropcalc['stdsignal'] = np.std(signal)
        else:
  	  dropcalc['drops'] = 0
	ddset['dropcalc'] = dropcalc
	return ddset
	














#python gearman.caller.image.proc.py strobimages/1422472908_V100_P50_LD250.jpg,strobimages/1422472988_V100_P90_LD250.jpg '345,87,125,300' 2 30 0 water
#python gearman.caller.image.proc.py uploads/1422472992_V100_P90_LD250.timestamp1560789874.jpg '345,87,125,300' 2 30 0 water

'''
idf = open('imgdataset')
imgdat = json.load(idf)
'''

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
        ddset =  strobimgprocess(img,set,mindiam,maxdiam,uthresh,imgname,deflectypos,deflectxpos,micronperpixel)
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
f = open('gearmanstrobdataset','w')
print imgname
#(path,namer) = re.split('\/', imgname)
jjn = re.split('\/', imgname)
namer = jjn[len(jjn)-1]
path = jjn[0:(len(jjn)-2)]
#img.save(path+'/'+namer)
f.write(jdset)
f.close()
#idf.close()
print jdset
#print "finished"
'''
{"dataset": [{"dropraw": [{"columncenter": 94, "columndiameter": 7, "deflection": 24.839999999999996, "drops": 0, "image": "strobimages/1422473085_V110_P90_LD250.jpg", "rowcenter": 45, "rowdiameter": 9, "signal": 9.9285714285714288, "speed": 629.28, "volume": 200.96000000000001}, {"columncenter": 95, "columndiameter": 14, "deflection": 33.12, "drops": 1, "image": "strobimages/1422473085_V110_P90_LD250.jpg", "rowcenter": 173, "rowdiameter": 11, "signal": 14.405982905982906, "speed": 1689.12, "volume": 678.24000000000001}], "image": "strobimages/1422473085_V110_P90_LD250.jpg"}, {"dropraw": [{"columncenter": 94, "columndiameter": 10, "deflection": 24.839999999999996, "drops": 0, "image": "strobimages/1422473098_V110_P90_LD250.jpg", "rowcenter": 45, "rowdiameter": 10, "signal": 11.556338028169014, "speed": 629.28, "volume": 392.5}, {"columncenter": 95, "columndiameter": 13, "deflection": 33.12, "drops": 1, "image": "strobimages/1422473098_V110_P90_LD250.jpg", "rowcenter": 173, "rowdiameter": 11, "signal": 13.921739130434782, "speed": 1689.12, "volume": 678.24000000000001}], "image": "strobimages/1422473098_V110_P90_LD250.jpg"}], "sample": "testwater"}

'''




