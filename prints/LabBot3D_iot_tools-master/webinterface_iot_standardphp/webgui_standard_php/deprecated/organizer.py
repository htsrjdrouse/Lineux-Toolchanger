import Image
import re
import numpy as np
import ImageDraw
import ImageFont
import sys
import time
import json
from math import ceil
import os



def spotquant(bx,by,dim,dat,adat):
	maxsig=[np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][1],np.histogram(dat, bins=2, range=None, normed=False, weights=None)[1][2]]
	threshold = maxsig[0]
	'''
	print "Threshold value: "
	print threshold
	print "Min val: " + str(np.min(dat))
	print "Max val: " + str(np.max(dat))
	'''
	d =np.where(adat > (threshold-1))
	dback =np.where(adat <= (threshold-1))
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
		
	statdict = {"cx":bx+col-dim,"cy":by+row-dim,"sptmean":np.mean(adat[d]),"sptdia":diam,"bckmean":np.mean(adat[dback]),"sn":(np.mean(adat[d])/np.mean(adat[dback]))}
	'''
	statxml = "<cx>"+str(col+bx-dim)+"</cx>"
	statxml = statxml + "<cy>"+str(row+by-dim)+"</cy>"
	statxml = statxml + "<sptmean>"+str(np.mean(adat[d]))+"</sptmean>"
	statxml = statxml + "<sptdia>"+str(diam)+"</sptdia>"
	statxml = statxml + "<bckmean>"+str(np.mean(adat[dback]))+"</bckmean>"
	statxml = statxml + "<sn>"+str((np.mean(adat[d])/np.mean(adat[dback])))+"</sn>"
	'''
	#print statdict
	return statdict



def poscalc(szx,szy,x,y,cx,cy):
	'''
	print 'GX: '+str(x)
	print 'GY: ' +str(y)
	print 'SZX: '+str(szx)
	print 'SZY: ' +str(szy)
	print 'CX: '+str(cx)
	print 'CY: ' +str(cy)
	'''
	pos = []
	if (cx > szx):
		#pos.append((cx -szx)/20. + x)
		pos.append((cx -szx)*0.02 + x)
	elif (cx < szx):
		#pos.append(x - (szx-cx)/20.)
		pos.append(x - (szx-cx)*0.02)
	else:
		pos.append(x)
	if (cy > szy):
		#pos.append((cy -szy)/20. + y)
		pos.append((cy -szy)*0.02 + y)
	elif (cx < szx):
		#pos.append(y - (szy-cy)/20.)
		pos.append(y - (szy-cy)*0.02)
	else:
		pos.append(y)
	return pos





CURRENT_DIR = os.path.dirname(__file__)

file_path = os.path.join(CURRENT_DIR, 'cur.transferlist')
a = open(file_path)

file_path = os.path.join(CURRENT_DIR, 'dataset')
aa = open(file_path, 'w')
file_path = os.path.join(CURRENT_DIR, 'data.report.txt')
dtr = open(file_path, 'w')


#G1X60Y86.6F3000_D5_IH

b = []
row = 0
col = 16
for i in a:
	i = re.sub('\n', '', i)
	c = {}
	if re.match('^G28.*', i):
		row = row + 1
		col = 16
		ct = 0
	if re.match('^G1.*', i):
			       #G1X60.09Y86.7F3000_D4_IH
		gp = re.match('^G1X(.*)Y(.*)F.*', i)
		col = 16 - ct
		ct = ct + 1
		c['row'] =row
		c['col'] =col
		c['x'] = gp.group(1)
		c['y'] = gp.group(2)
		b.append(c)

for i in range(0,len(b)):
	c = b[i]
	x = float(c['x'])
	y = float(c['y'])
	
	#47,97.55,0.00.jpg
	file = str(c['x'])+','+str(c['y'])+',0.00.jpg'
	imgfile_path = os.path.join(CURRENT_DIR, file)
	imgfiletar_path = os.path.join(CURRENT_DIR, 'pre'+file)
	os.system('convert '+imgfile_path+' '+imgfiletar_path)
	os.system('mv '+imgfiletar_path+' '+imgfile_path)
	imga = Image.open(imgfile_path)
	imgb = Image.open(imgfile_path)
	szx = (imga.size[0]/2)
	szy = (imga.size[1]/2)
	img = imga.convert('LA')
	img = img.split()[0]
	dim = 18
	#bx = 93
	#by = 138
	bx = 107
	by = 166
	box = (bx-dim, by-dim, bx+dim, by+dim)
	area = img.crop(box)
	pixels = list(area.getdata())
	dat = np.array(pixels)
	adat = np.reshape(dat,((bx+dim)-(bx-dim),(by+dim)-(by-dim)))
	res = spotquant(bx,by,dim,dat,adat)
	draw = ImageDraw.Draw(imga)
	draw.ellipse((res['cx']-res['sptdia']/2, res['cy']-res['sptdia']/2, res['cx']+res['sptdia']/2, res['cy']+res['sptdia']/2), fill=None, outline=(244, 51, 255))
	draw.ellipse((res['cx']-res['sptdia']/4, res['cy']-res['sptdia']/4, res['cx']+res['sptdia']/4, res['cy']+res['sptdia']/4), fill=(61, 255, 51))
	area = imga.crop(box)
	del draw 
	pos = poscalc(szx,szy,x,y,res['cx'],res['cy'])
	imgfile = 'x'+str(x)+'y'+str(y)+'.png'
	imgfile_path = os.path.join(CURRENT_DIR, imgfile)
	area.save(imgfile_path)
	draw = ImageDraw.Draw(imgb)
	draw.ellipse((bx-5,by-5,bx+5,by+5), fill=None, outline=(244, 51, 255))
	del draw 
	area = imgb.crop(box)
	imgfile = 'x'+str(x)+'y'+str(y)+'virt.png'
	imgfile_path = os.path.join(CURRENT_DIR, imgfile)
	area.save(imgfile_path)
	report = '<tr><td>'+str(c['row'])+','+str(c['col'])+'</td>'
	report = report + '<TD>GX: '+str(x) + ' GY: '+str(y)+'</td>'
	tpos = poscalc(szx,szy,x,y,bx+dim/2,by+dim/2)
	px = tpos[0] - 0.18
	py = tpos[1] - 0.18
	report = report + '<TD>PX: '+str(px) + ' PY: '+str(py)+'</td>'
	report = report +  '<td> IX: '+str(pos[0]) + ' IY: '+str(pos[1]) +'</td>'
	report = report +  '<td><font color=red> DX: '+str(round((px - pos[0]),2)) + ' DY: '+str(round((py-pos[1]),2))+ '</font></td>'
	report = report + '<td><img src=x'+str(x)+'y'+str(y)+'.png></td>'
	report = report + '<td><img src=x'+str(x)+'y'+str(y)+'virt.png></td></tr>'
	c['px'] = float(px)
	c['py'] = float(py)
	c['ix'] = float(pos[0])
	c['iy'] = float(pos[1])

	dtr.write(report+'\n')



aa.write(json.dumps(b))
dtr.close()


aa.close()
file_path = os.path.join(CURRENT_DIR, 'parser.py')
tarfile_path = os.path.join(CURRENT_DIR, 'data.report.txt')
resfile_path = os.path.join(CURRENT_DIR, 'data.report.html')
os.system('python '+file_path+' '+tarfile_path+' > '+resfile_path+' &')

