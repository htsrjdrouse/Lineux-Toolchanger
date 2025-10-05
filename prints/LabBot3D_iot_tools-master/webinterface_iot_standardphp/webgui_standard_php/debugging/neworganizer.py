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



def imgspotmap(dtr,npdct,maxy,miny,collen,rowlen):
	for i in range(0,len(npdct['x'])):
		imgload = "x"+str(npdct['x'][i])+"y"+str(npdct['y'][i])+"virt.png"
		minxpos = min(npdct['x'])# * 20
		maxxpos = max(npdct['x'])# * 20
		imgxpos = ((npdct['x'][i])-min(npdct['x'])) * ((collen*(36/4.))/(maxxpos - minxpos))
		imgypos = (npdct['y'][i]-minypos) * ((rowlen*20)/(maxy - minypos))   # * 20
		'''
		print 'Min xpos: '+str(minxpos)
		print 'Max xpos: '+str(maxxpos)
		print 'Min ypos: '+str(minypos)
		print 'Max ypos: '+str(maxy)
		print 'Img xpos: '+str(npdct['x'][i])
		print 'Img ypos: '+str(npdct['y'][i])
		print 'Img normxpos: '+str(imgxpos)
		print 'Img normypos: '+str(imgypos)
		print imgypos
		'''
		dtr.write("<?php array_push($imgstack,'"+imgload+"'); ?>\n")
		dtr.write("<?php array_push($imgstackx,'"+str(imgxpos)+"'); ?>\n")
		dtr.write("<?php array_push($imgstacky,'"+str(imgypos)+"'); ?>\n")
		dtr.write("\n<?php $imgload"+str(i)+" = '"+imgload+"'; ?>")


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


def nloop(row,dtr,b,rowcollection):
	nloopdict = {}
	aax = rowcollection[row]['x']
	aay = rowcollection[row]['y']

	ix = []
	iy = []
	px = []
	py = []
	dx = []
	dy = []
	ict=0
	misswells = 0
	dxmisses = []
	dymisses = []
	for i in rowcollection[row]['key']:
		ix.append(b[i]['ix'])
		iy.append(b[i]['iy'])
		px.append(b[i]['px'])
		py.append(b[i]['py'])
		dx.append(b[i]['dx'])
		dy.append(b[i]['dy'])
		if (abs(b[i]['dx']) >= 0.05):
			misswells = misswells + 1
			dxmisses.append(i)
		elif (abs(b[i]['dy']) >= 0.05):
			misswells = misswells + 1
			dymisses.append(i)

	nloopdict['misswells'] = misswells
	nloopdict['dxmisses'] = dxmisses
	nloopdict['dymisses'] = dymisses
	nloopdict['dx'] = dx
	nloopdict['dy'] = dy
	nloopdict['x'] = aax
	nloopdict['y'] = aay
	nloopdict['ix'] = np.array(ix)
	nloopdict['iy'] = np.array(iy)
	nloopdict['px'] = np.array(px)
	nloopdict['py'] = np.array(py)
	nloopdict['key'] = rowcollection[row]['key']

	return nloopdict


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
pdaa = open(file_path)
daa = json.load(pdaa)
pdaa.close()

file_path = os.path.join(CURRENT_DIR, 'dataset')
faa = open(file_path, 'w')
file_path = os.path.join(CURRENT_DIR, 'data.report.php')
dtr = open(file_path, 'w')

#G1X60Y86.6F3000_D5_IH

b = []
row = 0
col = 16

ln = []
for i in daa:
	ln.append(i)

aa = []
aa = np.array(aa)
rr = 0
for i in a:
	if re.match('^G1.*', i):
		rr = rr + 1
		gp = re.match('^G1X(.*)Y(.*)F.*', i)
		#aa = np.insert(aa, len(aa), int(round(float(gp.group(1)))))
		#aa = np.insert(aa, len(aa), int(round(float(gp.group(2)))))
		aa = np.insert(aa, len(aa), float(gp.group(1)))
		aa = np.insert(aa, len(aa), float(gp.group(2)))
		aa = np.insert(aa, len(aa), int(round(float(gp.group(1)))))
		aa = np.insert(aa, len(aa), int(round(float(gp.group(2)))))


dd = np.reshape(aa, (rr,4))
ee = dd[:,2:]
yry = ee[:,1]
xry = ee[:,0]
#print yry
#print min(xry)
sortedrows = np.unique(np.sort(yry))
#print sortedrows


datlist = []
rowcollection = []
cnt = 0
for i in sortedrows:
	c = {}
	ro = []
	co = []
	ky = []
	dset = dd[np.where(yry==i)[0][0:]]
	xpos = dset[:,0]
	c['x'] = xpos
	ypos = dset[:,1]
	c['y'] = ypos
	xposin = dset[:,2]
	yposin = dset[:,3]
	for j in xposin:
		ro.append(j-min(xry)+1)
	for k in yposin:
		co.append(k-min(yry)+1)
		ky.append(cnt)
		cnt = cnt+1
	c['col'] = ro
	c['row'] = co
	c['key'] = ky
	rowcollection.append(c)





b = []
dfx = []
dfy = []
reportlist = []
bct = 0
#print 'row length '+str(len(sortedrows))
for i in range(0,len(sortedrows)):
	#dtr.write('Row length: '+str(i+1)+' '+str(len(rowcollection[i]['row'])))
	for j in range(0, len(rowcollection[i]['row'])):
		sc = {}
		sc['row']= int(rowcollection[i]['row'][j])
		sc['col']= int(rowcollection[i]['col'][j])
		sc['x']= rowcollection[i]['x'][j]
		sc['y']= rowcollection[i]['y'][j]
		sc['rowcollkey']= rowcollection[i]['key'][j]
		x = float(sc['x'])
		y = float(sc['y'])

		#47,97.55,0.00.jpg
		#collect pictures ... could be checked here
		file = str(sc['x'])+','+str(sc['y'])+',0.00.jpg'
		imgfile_path = os.path.join(CURRENT_DIR, file)
		imgfiletar_path = os.path.join(CURRENT_DIR, 'pre'+file)
		os.system('convert '+imgfile_path+' '+imgfiletar_path)
		os.system('mv '+imgfiletar_path+' '+imgfile_path)

		#open images in pil
		imga = Image.open(imgfile_path)
		imgb = Image.open(imgfile_path)
		szx = (imga.size[0]/2)
		szy = (imga.size[1]/2)
		img = imga.convert('LA')
		img = img.split()[0]

		#crop images for processing
		dim = 18
		bx = 107
		by = 166
		box = (bx-dim, by-dim, bx+dim, by+dim)
		area = img.crop(box)

		#analyze data
		pixels = list(area.getdata())
		dat = np.array(pixels)
		adat = np.reshape(dat,((bx+dim)-(bx-dim),(by+dim)-(by-dim)))
		res = spotquant(bx,by,dim,dat,adat)

		#draw some graphics on the images
		draw = ImageDraw.Draw(imga)
		draw.ellipse((res['cx']-res['sptdia']/2, res['cy']-res['sptdia']/2, res['cx']+res['sptdia']/2, res['cy']+res['sptdia']/2), fill=None, outline=(244, 51, 255))
		draw.ellipse((res['cx']-res['sptdia']/4, res['cy']-res['sptdia']/4, res['cx']+res['sptdia']/4, res['cy']+res['sptdia']/4), fill=(61, 255, 51))
		area = imga.crop(box)
		del draw 
		pos = poscalc(szx,szy,x,y,res['cx'],res['cy'])
		imgfile = 'x'+str(x)+'y'+str(y)+'.png'
		imgfile_path = os.path.join(CURRENT_DIR, imgfile)
		area.save(imgfile_path)
	
			
		area = imgb.crop(box)
		'''
		imgfile = 'x'+str(x)+'y'+str(y)+'blank.png'
		imgfile_path = os.path.join(CURRENT_DIR, imgfile)
		area.save(imgfile_path)
		'''

		draw = ImageDraw.Draw(imgb)
		draw.ellipse((bx-5,by-5,bx+5,by+5), fill=None, outline=(244, 51, 255))
		del draw 
		imgfile = 'x'+str(x)+'y'+str(y)+'virt.png'
		imgfile_path = os.path.join(CURRENT_DIR, imgfile)
		area.save(imgfile_path)

		sc['ix'] = float(pos[0])
		sc['iy'] = float(pos[1])



		#write report
		report = '<tr><td>'+str(sc['row'])+','+str(sc['col'])+'</td>'
		report = report + '<TD>GX: '+str(x) + ' GY: '+str(y)+'</td>'
		tpos = poscalc(szx,szy,x,y,bx+dim/2,by+dim/2)
		px = tpos[0] - 0.18
		py = tpos[1] - 0.18
		sc['px'] = float(px)
		sc['py'] = float(py)
		dfx.append(((px - pos[0]),2))
		dfy.append(((py-pos[1]),2))
		dx = round((px - pos[0]),2)
		dy = round((py-pos[1]),2)
		report = report + '<TD>PX: '+str(px) + ' PY: '+str(py)+'</td>'
		report = report +  '<td> IX: '+str(pos[0]) + ' IY: '+str(pos[1]) +'</td>'
		report = report +  '<td><font color=red> DX: '+str(round((px - pos[0]),2)) + ' DY: '+str(round((py-pos[1]),2))+ '</font></td>'
		report = report + '<td><img src=x'+str(x)+'y'+str(y)+'.png></td>'
		report = report + '<td><img src=x'+str(x)+'y'+str(y)+'virt.png></td>'


		modx= round(float(sc['x']) + float(sc['ix'] - sc['px']),2)
		mody= round(float(sc['y']) + float(sc['iy'] - sc['py']),2)
		report = report + '<td><input type="checkbox" name="well[]" value="'+str(sc['row'])+'"> Change?'
		report = report +'<br>X: <input type="text" name="manxval[]" value="'+str(modx)+'" size=8>'
		report = report +'<br>Y: <input type="text" name="manyval[]" value="'+str(mody)+'" size=8>'
		report = report +'</font></td>'
		if abs(dx)>0.05:
			report = report +'<td><font color=red>X</font></td></tr>'
		elif abs(dy)>0.05:
			report = report +'<td><font color=red>X</font></td></tr>'
		else:
			report = report +'<td><font color=blue>pass</font></td></tr>'



		#assigning variables
		sc['dx'] = float(round((px - pos[0]),2))
		sc['dy'] = float(round((py - pos[1]),2))
		sc['px'] = float(px)
		sc['py'] = float(py)
		sc['ix'] = float(pos[0])
		sc['iy'] = float(pos[1])
		sc['key'] = bct
		#dtr.write(report+'\n')
		
		b.append(sc)
		bct = bct + 1
		reportlist.append(report)

	



dtr.write('<ul>\n')
dtr.write('<?php include("page.header.inc.php"); ?>')

dtr.write('<br>')

bx = rowcollection[0]['x'][0]
ex = rowcollection[0]['x'][len(rowcollection[0]['x'])-1]
by = rowcollection[0]['y'][0]
ey = rowcollection[len(sortedrows)-1]['y'][len(rowcollection[0]['y'])-1]
minypos = min([by,ey])
dtr.write('<br>')

npdct = nloop(0,dtr,b,rowcollection)
bx = npdct['ix'][0]
ex = npdct['ix'][len(npdct['ix'])-1]
by = npdct['iy'][0]
npdct = nloop(len(sortedrows)-1,dtr,b,rowcollection)
ey = npdct['iy'][len(npdct['iy'])-1]

dtr.write('<?php $xlen = '+str(320)+'; ?>')
dtr.write('<?php $ylen = '+str(240)+'; ?>')
dtr.write("<?php $bimgstack = array(); ?>\n")
dtr.write("<?php $bimgstackx = array(); ?>\n")
dtr.write("<?php $bimgstacky = array(); ?>\n")
dtr.write('<?php $bimgstack[0] = "t.png" ?>');
dtr.write("<?php array_push($bimgstackx,'"+str(0)+"'); ?>\n")
dtr.write("<?php array_push($bimgstacky,'"+str(0)+"'); ?>\n")
dtr.write('<br>\n')

dtr.write('<?php include("imageviewer.process.inc.php"); ?>')
dtr.write('<br>\n')


dtr.write('<br><table border=1>\n')
dtr.write('<tr><td>Avg Dif X: '+str(round(np.mean(dfx),2)*0.02)+'</td>\n')
dtr.write('<td>Min Dif X: '+str(round(np.min(dfx),2)*0.02)+'</td>\n')
dtr.write('<td>Max Dif X: '+str(round(np.max(dfx),2)*0.02)+'</td>\n')
dtr.write('</tr>\n')
dtr.write('<tr><td>Avg Dif Y: '+str(round(np.mean(dfy),2)*0.02)+'</td>\n')
dtr.write('<td>Min Dif Y: '+str(round(np.min(dfy),2)*0.02)+'</td>\n')
dtr.write('<td>Max Dif Y: '+str(round(np.max(dfy),2)*0.02)+'</td>\n')
dtr.write('</tr>\n')
dtr.write('</table><br><br>\n')
dtr.write('<hr>Raw data:<br><br>\n')
#<tr><TD>GX: 45.0 GY: 86.0</td><td> IX: 42.1 IY: 88.55</td><td><font color=red> DX: 2.9 DY: -2.55</font></td><td><img src=x45.0y86.0.png></td></tr>
dtr.write('<br>\n')








prepcoln = []
for i in range(0,len(sortedrows)):
	npdct = nloop(row,dtr,b,rowcollection)
	for j in npdct['iy']:
		prepcoln.append(j)

#print prepcoln
maxy = max(rowcollection[len(sortedrows)-1]['y'])
collen = max(prepcoln)
#print 'max collen: '+str(collen)
rowlen = len(sortedrows)

dtr.write('<?php $xlen = '+str(collen*(36/4.))+'; ?>')
dtr.write('<?php $ylen = '+str(rowlen*20)+'; ?>')
dtr.write("<?php $imgstack = array(); ?>\n")
dtr.write("<?php $imgstackx = array(); ?>\n")
dtr.write("<?php $imgstacky = array(); ?>\n")

for i in range(0,len(sortedrows)):
	npdct = nloop(i,dtr,b,rowcollection)
	imgspotmap(dtr,npdct,maxy,minypos,collen,rowlen)

dtr.write('<br>\n')
dtr.write('<?php include("process.pde.inc.php"); ?>')
dtr.write('<br>\n')



dtr.write('<form target="_blank" action="coordslist.php" method="POST">')
dtr.write('<input type=submit>')
dtr.write(' Select all wells: <input type=checkbox name=allwell value=all>')
rct = 0

arykey = 0
aky = []
aky = np.array(aky)
for i in sortedrows:
	ak = {}
	rct = rct + 1
	dtr.write(str(rct)+': <input type=checkbox name=selrows value='+str(rct)+'> ')












prepcoln = []
for i in range(0,len(sortedrows)):
	dtr.write('<br>\n')
	npdct = nloop(int(i),dtr,b,rowcollection)
	prepcoln.append(len(npdct['ix']))
	dtr.write(' MISSES: <font color=red>'+str(npdct['misswells'])+'</font> <br>')
	dtr.write(' KEY: '+str(npdct['key'])+' <br>')
	dtr.write(' IX: '+str(npdct['ix'])+' <br>')
	dtr.write(' IY: '+str(npdct['iy'])+' <br>')


dtr.write('<br>\n')
dtr.write('<br>\n')
dtr.write('testing processing\n')
dtr.write('<br>\n')
dtr.write('<br>\n')


#gotta clean up this other stuff

dtr.write('<br>\n')
dtr.write('<br>\n')
dtr.write('<br>\n')
dtr.write('<br>\n')
dtr.write(' LEN COLS: '+str(len(sortedrows)))
dtr.write('<br>')

dtr.write('TBIX: '+str(rowcollection[0]['x'][0]))
dtr.write(' TBIY: '+str(rowcollection[0]['y'][0]))
dtr.write(' TBRW: '+str(rowcollection[0]['row'][0]))
dtr.write(' TBCL: '+str(rowcollection[0]['col'][0]))
dtr.write('<br>')
dtr.write(' BX: '+str(b[0]['x']))
dtr.write(' BY: '+str(b[0]['y']))
dtr.write(' BIX: '+str(b[0]['ix']))
dtr.write(' BIY: '+str(b[0]['iy']))
dtr.write(' BRW: '+str(b[0]['row']))
dtr.write(' BCL: '+str(b[0]['col']))
dtr.write('<br>')


'''
dtr.write('TBIY: '+str(rowcollection[0]['y']))
dtr.write('TEIX: '+str(rowcollection[0]['x'][len(rowcollection[0]['x']-1)]))
dtr.write('TEIY: '+str(rowcollection[0]['y'][len(rowcollection[0]['y']-1)]))
'''



dtr.write('<br><br>')


dtr.write('<br><br>\n')
dtr.write('<table border=1><tr>\n')
dtr.write('<td>Row,Col</td>\n')
dtr.write('<td>Gcode position</td>\n')
dtr.write('<td>Spot center position</td>\n')
dtr.write('<td>Image detection position</td>\n')
dtr.write('<td>Difference</td>\n')
dtr.write('<td>Image</td>\n')
dtr.write('<td>Ideal Image</td>\n')
dtr.write('<td>Select Teaching Well</td>\n')
dtr.write('<td>Test</td>\n')




dtr.write('</tr>\n')


#print b

for i in reportlist:
	dtr.write(i+'\n');
dtr.write('</table>\n')


dtr.write('</html>\n')


faa.write(json.dumps(b))


dtr.write('</ul>\n')

dtr.close()

faa.close()
#file_path = os.path.join(CURRENT_DIR, 'parser.py')
#tarfile_path = os.path.join(CURRENT_DIR, 'data.report.txt')
#resfile_path = os.path.join(CURRENT_DIR, 'data.report.html')
#os.system('python '+file_path+' '+tarfile_path+' > '+resfile_path+' &')



