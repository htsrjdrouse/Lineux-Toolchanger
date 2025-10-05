import sys
import Image
import re
import numpy as np
import ImageDraw
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



#strobsettings.php?set=345,87,125,300&file=1422472992_V100_P90.jpg
#python caller.image.proc.py 1422472992_V100_P90.jpg '345,87,125,300' 2

img = Image.open(sys.argv[1]).convert('LA')
img = img.split()[0]

set = sys.argv[2]
dtaset = re.split(',', set)

aax =int(dtaset[0])
aay =int(dtaset[1])
wdim =int(dtaset[2])
ldim =int(dtaset[3])

mindiam = int(sys.argv[3])


'''
aax = 341
aay = 92
wdim = 220
ldim = 450
'''

draw = ImageDraw.Draw(img)


box = (aax, aay, aax+wdim, aay+ldim)
area = img.crop(box)
szarea= area.size

draw = ImageDraw.Draw(area)
pixels = list(area.getdata())
dat = np.array(pixels)
ex = aax+wdim
ey = aay+ldim
adat = np.reshape(dat,(szarea[1],szarea[0]))

maxsig=[np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][1],np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][2]]

threshold = maxsig[0]

'''
dropdat = []
row = []
for i in range(0,szarea[1]):
  for j in range(0,szarea[0]):
    if (adat[i][j] <= (threshold-1)):
	pa = {}
	pa = {'row':i, 'col':j, 'val':adat[i][j]}
	row.append(i)
	dropdat.append(pa)
'''


sigs = np.where(adat > threshold)
row = sigs[0]
row = np.array(row)
row = np.sort(row)
uniqrow = np.unique(row)
#print uniqrow

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
  '''
  for k in dropdat:
    if (k['row'] >= drops[i][0]) and (k['row'] <= drops[i][len(drops[i])-1]):
     ad['droprows'].append(k['row'])
     ad['dropcols'].append(k['col'])
  '''
  for j in range(0,len(sigs[0])):
    if (sigs[0][j] >= drops[i][0]) and (sigs[0][j] <= drops[i][len(drops[i])-1]):
     ad['droprows'].append(sigs[0][j])
     ad['dropcols'].append(sigs[1][j])

  ad['rowdiam'] = np.max(np.bincount(ad['droprows']))
  ad['rowcent'] = int(ceil(np.median(np.where(np.bincount(ad['droprows']) > 0 )[0])))
  ad['coldiam'] = np.max(np.bincount(ad['droprows']))
  ad['colcent'] = int(ceil(np.median(np.where(np.bincount(ad['dropcols']) > 0 )[0])))
  ad['avgrad'] = (ad['rowdiam'] + ad['coldiam'])/4
  ad['volume'] = (4/3)*3.14*(ad['avgrad']*ad['avgrad']*ad['avgrad'])


  draw.point((ad['rowcent'],ad['colcent']), ("red"))
  dropsdata.append(ad)

#{"rowdiameter":[],"rowcenter":[],"columndiameter":[],"columncenter":[],"volume":[]}

dset = []
a = 0
for i in dropsdata:
	datr = {}
	datr['image'] = sys.argv[1]
	datr['rowdiameter'] = i['rowdiam']
	datr['rowcenter'] = i['rowcent']
	datr['columndiameter'] = i['coldiam']
	datr['columncenter'] = i['colcent']
	datr['volume'] = i['volume']
	if ((datr['rowdiameter'] >= mindiam) or (datr['columndiameter'] >= mindiam)):
		datr['drops'] = a
		a = a + 1
		datr['signal'] = dropquant(adat,(datr['rowcenter']),(datr['columncenter']),datr['rowdiameter'],datr['columndiameter'],threshold)
		dset.append(datr)


ddset = {}
ddset['image'] = sys.argv[1]
ddset['dropraw'] = dset

jdset = json.dumps(ddset, sort_keys=True)
f = open('strobdataset','w')
f.write(jdset)
f.close()
#print 'finished'
#area.save('example.png')

