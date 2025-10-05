import sys
import Image
import re
import numpy as np
import ImageDraw
from math import ceil
import json

#@profile
def dropquant(adat,rowcenter,columncenter, rowdiameter, columndiameter,threshold):
	brow = rowcenter - ((rowdiameter+4/2))
	erow = rowcenter + ((rowdiameter+4/2))
	bcol = columncenter - ((columndiameter+4/2))
	ecol = columncenter + ((columndiameter+4/2))
	pixelsig = adat[brow:erow,bcol:ecol]
	threshsig = np.where(pixelsig < threshold)
	avgsig = 0
	if (len(threshsig[0]) > 0):
		avgsig = np.mean(threshsig)
	return avgsig



#@profile
def processing(img,set,mindiam):
	#select area to analyze
	dtaset = re.split(',', set)
	aax =int(dtaset[0])
	aay =int(dtaset[1])
	wdim =int(dtaset[2])
	ldim =int(dtaset[3])
	
	img = img.split()[0]
	box = (aax, aay, aax+wdim, aay+ldim)
	area = img.crop(box)
	szarea= area.size
	#select minimum diameter to analyze

	#draw = ImageDraw.Draw(area)
	pixels = list(area.getdata())
	dat = np.array(pixels)
	ex = aax+wdim
	ey = aay+ldim
	#form a 2d array that reflects shape of selected image
	adat = np.reshape(dat,(szarea[1],szarea[0]))

	maxsig=[np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][1],np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][2]]
	threshold = maxsig[0]


	## Right here is the slow part
	# select pixels less then threshold to get the signal
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
	## here is another way which could be faster
	sigs = np.where(adat <= (threshold-1))
	row = sigs[0]


	#select the rows that have signals
	row = np.array(row)
	row = np.sort(row)
	#get a non redundant list of rows having signals
	uniqrow = np.unique(row)
	#print uniqrow

	#now search through rows to collect the pixels representing the spot signal and store in drops array
	drops = []
	drop = []
	for i in range(0,len(uniqrow)):
		if uniqrow[i] < np.max(uniqrow):
			if uniqrow[i+1] <= uniqrow[i] + 4:
				drop.append(uniqrow[i])
			else:
				drop.append(uniqrow[i])
				drops.append(drop)


	#print drops

        ## Right here I should try to split up maybe run PyPy up to this ...


	#now store data about the detected drops
	dropsdata = []
	dropdata = []
	for i in range(0,len(drops)):
		droprow = drops[i]
		ad = {}
		ad['drop'] = i+1
		ad['droprows'] = []
		ad['dropcols'] = []
		## So here this loop has to be modified
		'''
		for k in dropdat:
			if (k['row'] >= drops[i][0]) and (k['row'] <= drops[i][len(drops[i])-1]):
				ad['droprows'].append(k['row'])
				ad['dropcols'].append(k['col'])
		'''
		for k in range(0,len(sigs[0])):	
			sigsrow = sigs[0][k]	
			sigscol = sigs[1][k]	
			if (sigsrow >= drops[i][0]) and (sigsrow <= drops[i][len(drops[i])-1]):
				ad['droprows'].append(sigsrow)
				ad['dropcols'].append(sigscol)

		ad['rowdiam'] = np.max(np.bincount(ad['droprows']))
		ad['rowcent'] = int(ceil(np.median(np.where(np.bincount(ad['droprows']) > 0 )[0])))
		ad['coldiam'] = np.max(np.bincount(ad['droprows']))
		ad['colcent'] = int(ceil(np.median(np.where(np.bincount(ad['dropcols']) > 0 )[0])))
		ad['avgrad'] = (ad['rowdiam'] + ad['coldiam'])/4
		ad['volume'] = (4/3)*3.14*(ad['avgrad']*ad['avgrad']*ad['avgrad'])
		dropsdata.append(ad)	


	dset = []
	a = 0
	for i in dropsdata:
		datr = {}
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
	#print dset
	return dset



## Open the image
#time python caller.image.proc.py line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png 388,110,175,400 5
img = Image.open(sys.argv[1]).convert('LA')
set = sys.argv[2]
mindiam = int(sys.argv[3])


dset = processing(img,set,mindiam)

print dset



### here I got to call this function
'''
jdset = json.dumps(dset, sort_keys=True)
f = open('strobdataset','w')
f.write(jdset)
f.close()

print 'finished'
#area.save('example.png')

'''




