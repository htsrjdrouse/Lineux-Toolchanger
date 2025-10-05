
import json
import os
import sys
import Image
import re
import numpy as np
import ImageDraw
from math import ceil


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
	statdict = {"centx":col,"centy":row,"cx":imgx+col+bx-dim/2,"cy":imgy+row+by-dim/2,"sptmean":np.mean(sdat[d]),"sptdia":int(diam),"bckmean":np.mean(sdat[dback]),"sn":(np.mean(sdat[d])/np.mean(sdat[dback])), "sr":sr, "sc":sc}
	'''
	statxml = "<cx>"+str(imgx+col+bx-dim/2)+"</cx>"
	statxml = statxml + "<cy>"+str(imgy+row+by-dim/2)+"</cy>"
	statxml = statxml + "<sptmean>"+str(np.mean(sdat[d]))+"</sptmean>"
	statxml = statxml + "<sptdia>"+str(diam)+"</sptdia>"
	statxml = statxml + "<bckmean>"+str(np.mean(sdat[dback]))+"</bckmean>"
	statxml = statxml + "<sn>"+str((np.mean(sdat[d])/np.mean(sdat[dback])))+"</sn>"
	statxml = statxml + "<sr>"+str(sr)+"</sr>"
	statxml = statxml + "<sc>"+str(sc)+"</sc>"
	'''
	return statdict


def imageprocessor(adat,aax,aay,adim,bx,by,i,j,area,key,aarea):
	adim = (adim*2)
	boxry = adat[aax:aax+adim,aay:aay+adim]
	box = (aax, aay, aax+adim, aay+adim)
	area1 = area.crop(box)
	drarea1 = aarea.crop(box)
	res = spotquant((i+1),(j+1),boxry,aax,aay,bx,by,adim,adat)
	draw = ImageDraw.Draw(drarea1)
	draw.ellipse((res['centx']-res['sptdia']/2, res['centy']-res['sptdia']/2, res['centx']+res['sptdia']/2, res['centy']+res['sptdia']/2), fill=None, outline=(244, 51, 255))
	draw.ellipse((res['centx']-res['sptdia']/4, res['centy']-res['sptdia']/4, res['centx']+res['sptdia']/4, res['centy']+res['sptdia']/4), fill=(61, 255, 51))
	drarea1.save('k'+str(key)+'_c'+str(i+1)+'_'+str(j+1)+'.png')
	res['file'] = 'k'+str(key)+'_c'+str(i+1)+'_'+str(j+1)+'.png'
	del draw 
	return res



def imgopen(file,bx,by,ex,ey,dim,xnum,ynum,spacex,spacey,key):
	os.system('convert '+file+' '+'process'+file)
	img = Image.open('process'+file).convert('LA')
	img = img.split()[0]
	imga = Image.open(file) 
	box = (bx-dim, by-dim, bx+ex+dim, by+ey+dim)
	#print "("+str(bx)+"-"+str(dim)+", "+str(by)+"-"+str(dim)+", "+str(bx)+"+"+str(ex)+"+"+str(dim)+", "+str(by)+"+"+str(ey)+"+"+str(dim)+")"
	area = img.crop(box)
	aarea = imga.crop(box)
	spotstatdict = []
	pixels = list(area.getdata())
	dat = np.array(pixels)
	adat = np.reshape(dat,(ex+2*dim,ey+2*dim))

	for i in range(0,ynum):
		for j in range(0,xnum):
			aax = j*spacex
			aay = i*spacey
			res = imageprocessor(adat,aax,aay,dim,bx,by,i,j,area,key,aarea)
			spotstatdict.append(res)
	#<cx>31</cx><cy>152</cy><sptmean>191.244897959</sptmean><sptdia>8</sptdia><bckmean>12.0825119685</bckmean><sn>15.828239894</sn><sr>1</sr><sc>1</sc>

	os.system('sudo rm '+'process'+file)
	return spotstatdict



CURRENT_DIR = os.path.dirname(__file__)

f = open('imgdataset')
dat = json.load(f)
f.close()

pcoords = []
xry = []
yry = []
for i in dat['gcodefile']['gmvlines']:
	if re.match('^G1', i):
		pcoords.append(i)
		if re.match('^.*X.*$', i):
			px = re.match('^.*X(.*)$', i)
			cx = re.sub('[a-zA-Z].*', '', px.group(1))
			xry.append(float(cx))
		if re.match('^.*Y.*$', i):
			py = re.match('^.*Y(.*)$', i)
			cy = re.sub('[a-zA-Z].*', '', py.group(1))
			yry.append(float(cy))

xry = np.array(xry)
yry = np.array(yry)
minx = np.min(xry)
miny = np.min(yry)
bx = int(dat['grid']['pbx'])
by = int(dat['grid']['pby'])
ex = int(dat['grid']['ex'])
ey = int(dat['grid']['ey'])
xnum = int(dat['grid']['xnum'])
ynum = int(dat['grid']['ynum'])
spacex = int(dat['grid']['spacex'])
spacey = int(dat['grid']['spacey'])
dim = 30

anotlist = []
for i in range(0,len(xry)):
	adict = {}
	adict['x'] = xry[i]
	adict['y'] = yry[i]
	adict['row'] = (yry[i] - miny) + 1
	adict['col'] = (xry[i] - minx) + 1
	adict['key'] = i
	adict['raw'] = pcoords[i]
	adict['file'] = str(xry[i])+'_'+str(yry[i])+'_'+str(0)+'.jpg'
	print (adict['file'],bx,by,ex,ey,dim,xnum,ynum,spacex,spacey,adict['key'])
	spotstatdict = imgopen(adict['file'],bx,by,ex,ey,dim,xnum,ynum,spacex,spacey,adict['key'])
	ct = 0
	adict['keyimgdata']= {}
	adict['keyimgdata']['key'] = i
	adict['keyimgdata']['cx'] = []
	adict['keyimgdata']['cy'] = []
	adict['keyimgdata']['centx'] = []
	adict['keyimgdata']['centy'] = []
	adict['keyimgdata']['sptmean'] = []
	adict['keyimgdata']['bckmean'] = []
	adict['keyimgdata']['sptdia'] = []
	adict['keyimgdata']['sn'] = []
	adict['keyimgdata']['sr'] = []
	adict['keyimgdata']['sc'] = []
	adict['keyimgdata']['file'] = []
	#statdict = {"centx":col,"centy":row,"cx":imgx+col+bx-dim,"cy":imgy+row+by-dim,"sptmean":np.mean(sdat[d]),"sptdia":diam,"bckmean":np.mean(sdat[dback]),"sn":(np.mean(sdat[d])/np.mean(sdat[dback])), "sr":sr, "sc":sc}
	for ii in range(0,ynum):
		for jj in range(0,xnum):
			adict['keyimgdata']['cx'].append(spotstatdict[ct]['cx'])
			adict['keyimgdata']['cy'].append(spotstatdict[ct]['cy'])
			adict['keyimgdata']['centx'].append(spotstatdict[ct]['centx'])
			adict['keyimgdata']['centy'].append(spotstatdict[ct]['centy'])
			adict['keyimgdata']['sptmean'].append(spotstatdict[ct]['sptmean'])
			adict['keyimgdata']['bckmean'].append(spotstatdict[ct]['bckmean'])
			adict['keyimgdata']['sptdia'].append(spotstatdict[ct]['sptdia'])
			adict['keyimgdata']['sn'].append(spotstatdict[ct]['sn'])
			adict['keyimgdata']['sr'].append(spotstatdict[ct]['sr'])
			adict['keyimgdata']['sc'].append(spotstatdict[ct]['sc'])
			adict['keyimgdata']['file'].append(spotstatdict[ct]['file'])
			ct = ct + 1
	anotlist.append(adict)





dat['imageprocessing']['data'] = anotlist

f = open('imgdataset', 'w')
f.write(json.dumps(dat))
f.close()
print anotlist


#cmd =  'sudo python wellmap.py '+dat['grid']['pbx']+' '+dat['grid']['pby']+' '+dat['grid']['ex']+' '+dat['grid']['ey']+' '+file+' '+str(dim)+' '+dat['grid']['xnum']+' '+dat['grid']['ynum']+' '+dat['grid']['spacex']+' '+dat['grid']['spacey'];


















