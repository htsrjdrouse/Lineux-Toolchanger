import sys,re
import numpy as np


def parser(gcodestr):
	gp = re.match('^R(.*)C(.*)G1(.*)$', i)
	row = gp.group(1)
	col = gp.group(2)
	gcode = gp.group(3)
	strdat = {'row':int(row), 'col':int(col), 'gcode':gcode}
	return strdat

#R1C16G1X60.09Y86.7

a = open(sys.argv[1])

rwy = []
cly = []
gcode = []
for i in a:
	i = re.sub('\n|\r', '', i)
	strdat = parser(i)
	rwy.append(strdat['row'])
	cly.append(strdat['col'])
	gcode.append(strdat['gcode'])

rwy =np.array(rwy)
wrwy = np.where(rwy == rwy[0])
counter= len(wrwy[0])


print 'M92X99.8'
print 'M92Y112.75'

print 'G28X0Y0_D3'

lct = 0
for i in gcode:
	lct = lct + 1
	if lct == 1:
		print 'G1'+i + 'F3000_D4_IH'
	if lct == 2:
		print 'G1'+i + 'F3000_D3_IH'
	if lct == counter:
		print 'G1'+i+ 'F3000_D3_IH'
		print 'G28X0_D3'
		lct = 0
