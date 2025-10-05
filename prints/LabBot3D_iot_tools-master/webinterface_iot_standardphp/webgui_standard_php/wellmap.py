#python wellmap.py 272 244 100 100 headcamnsnap1385492435.jpg 30 3 3 50 50

import sys
import Image
import re
import numpy as np
import ImageDraw
from math import ceil

#kernprof.py -l -v wellmap.py 272 244 100 100 headcamnsnap1385492435.jpg

#@profile

def spotquant(sr,sc,sdat,imgx,imgy,bx,by,dim,adat):
	maxsig=[np.histogram(sdat, bins=2, range=None, normed=False, weights=None)[1][1],np.histogram(sdat, bins=2, range=None, normed=False, weights=None)[1][2]]
	threshold = maxsig[0]
	#print "Threshold value: "
	#print threshold
	d =np.where(sdat > (threshold-1))
	dback =np.where(sdat <= (threshold-1))

	# this calculates row center
	rowdiam = np.max(np.bincount(d[0]))
	row = int(ceil(np.median(np.where(np.bincount(d[0]) > 0 ))))

	# this calculates column center
	coldiam = np.max(np.bincount(d[1]))
	col = int(ceil(np.median(np.where(np.bincount(d[1]) > 0 ))))

	#print "(row,col): " + str(row)+","+str(col)
	#print "longest diameters (row,col): " + str(rowdiam)+","+str(coldiam)

	if rowdiam >= coldiam:
		diam =rowdiam
	else:
		diam =coldiam
	# Now for the signal intensities
	# There are two ways to do this, the quick and dirty is just to collect the pixels higher then threshold from whole search area and this would include abberations and satallites, but its fast enough

	#print "Mean spot intensity: "+ str(np.mean(sdat[d]))
	#print "Local background intensity: "+ str(np.mean(sdat[dback]))
		
	#statdict = {"cx":imgx+col+bx-dim,"cy":imgy+row+by-dim,"sptmean":np.mean(sdat[d]),"sptdia":diam,"bckmean":np.mean(sdat[dback]),"sn":(np.mean(sdat[d])/np.mean(sdat[dback])), "sr":sr, "sc":sc}
	statxml = "<cx>"+str(imgx+col+bx-dim/2)+"</cx>"
	statxml = statxml + "<cy>"+str(imgy+row+by-dim/2)+"</cy>"
	statxml = statxml + "<sptmean>"+str(np.mean(sdat[d]))+"</sptmean>"
	statxml = statxml + "<sptdia>"+str(diam)+"</sptdia>"
	statxml = statxml + "<bckmean>"+str(np.mean(sdat[dback]))+"</bckmean>"
	statxml = statxml + "<sn>"+str((np.mean(sdat[d])/np.mean(sdat[dback])))+"</sn>"
	statxml = statxml + "<sr>"+str(sr)+"</sr>"
	statxml = statxml + "<sc>"+str(sc)+"</sc>"
	return statxml


#@profile

def imageprocessor(adat,aax,aay,adim,bx,by,i,j,area):
	adim = (adim*2)
	boxry = adat[aax:aax+adim,aay:aay+adim]
	box = (aax, aay, aax+adim, aay+adim)
	area1 = area.crop(box)
	#area1.save('c'+str(i+1)+'_'+str(j+1)+'.png')
	#def spotquant(sr,sc,sdat,imgx,imgy,bx,by,dim,adat):
	res = spotquant((i+1),(j+1),boxry,aax,aay,bx,by,adim,adat)
	return res

def imgopen(file,bx,by,ex,ey,dim,xnum,ynum,spacex,spacey):
	img = Image.open(file).convert('LA')
	img = img.split()[0]
	box = (bx-dim, by-dim, bx+ex+dim, by+ey+dim)
	#print "("+str(bx)+"-"+str(dim)+", "+str(by)+"-"+str(dim)+", "+str(bx)+"+"+str(ex)+"+"+str(dim)+", "+str(by)+"+"+str(ey)+"+"+str(dim)+")"
	area = img.crop(box)
	#area.save('ct.png')
	spotstatdict = []
	pixels = list(area.getdata())
	dat = np.array(pixels)
	adat = np.reshape(dat,(ex+2*dim,ey+2*dim))

	for i in range(0,ynum):
		for j in range(0,xnum):
			aax = j*spacex
			aay = i*spacey
			res = imageprocessor(adat,aax,aay,dim,bx,by,i,j,area)
			spotstatdict.append(res)
	#<cx>31</cx><cy>152</cy><sptmean>191.244897959</sptmean><sptdia>8</sptdia><bckmean>12.0825119685</bckmean><sn>15.828239894</sn><sr>1</sr><sc>1</sc>

	print spotstatdict




#note 20 microns per pixel
#sudo python wellmap.py 198 85 50 50 57.22_89.98_0.jpg 30 2 2 50 50
#sudo python wellmap.py 1   2  3  4  5                 6  7 8 9  10

#add as adjustable variables 
#dim could be half the width

bx = int(sys.argv[1])
by = int(sys.argv[2])
ex = int(ceil(float(sys.argv[3])))
ey = int(ceil(float(sys.argv[4])))
file = sys.argv[5]
#dim = 30
#dim = int(sys.argv[6])
dim = int(10)
xnum = int(sys.argv[7])
ynum = int(sys.argv[8])
spacex = float(sys.argv[9])
spacey = float(sys.argv[10])
imgopen(file,bx,by,ex,ey,dim,xnum,ynum,spacex,spacey)



