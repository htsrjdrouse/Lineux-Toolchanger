import re
import numpy as np
from math import ceil
import json
import os

CURRENT_DIR = os.path.dirname(__file__)
file_path = os.path.join(CURRENT_DIR, 'data.report.txt')
a = open(file_path)
file_path = os.path.join(CURRENT_DIR, 'dataset')
aa = open(file_path)
data = json.load(aa)
aa.close()
print """


<html>
<body>
<font face=arial>
Run 1 
<br><br>
X steps/mm set: M92X99.8
<br><br>
Y steps/mm: M92Y112.75
<br><br>
--Chip row 1--
<br><br>


"""





#<tr><td>1.0,16.0</td><TD>GX: 60.55 GY: 86.11</td><TD>PX: 59.49 PY: 87.03</td><td> IX: 59.49 IY: 87.21</td><td><font color=red> DX: 0.0 DY: -0.18</font></td><td><img src=x60.55y86.11.png></td><td><img src=x60.55y86.11virt.png></td></tr>
#<tr><TD>GX: 45.0 GY: 86.0</td><td> IX: 42.1 IY: 88.55</td><td><font color=red> DX: 2.9 DY: -2.55</font></td><td><img src=x45.0y86.0.png></td></tr>
datlist = []
dfx = []
dfy = []
for i in a:
	b = re.match('^.*GX: (.*) GY: (.*)<.*IX: (.*) IY: (.*)<.*DX: (.*) DY: (.*)<\/font.*', i)
	dx =  float(b.group(5))
	dy =  float(b.group(6))
	dfx.append(dx)
	dfy.append(dy)
	datlist.append(i)


dfx = np.array(dfx)
dfy = np.array(dfy)

print str(dfx)
print str(np.mean(dfx))
print '<bR>'
print str(np.max(dfx)-np.min(dfx))
print '<bR>'

print '<br><table border=1>'
print '<tr><td>Avg Dif X: '+str(round(np.mean(dfx),2))+'</td>'
print '<td>Min Dif X: ' +str(round(np.mean(dfx)-np.min(dfx),2))+'</td>'
print '<td>Max Dif X: '+str(round(np.max(dfx)-np.mean(dfx),2))+'</td>'
print '<td>%CV X: '+str(np.mean(dfx))+'</td></tr>'
print '<tr><td>Avg Dif Y: '+str(round(np.mean(dfy),2))+'</td>'
print '<td>Min Dif Y: ' +str(round(np.mean(dfy)-np.min(dfy),2))+'</td>'
print '<td>Max Dif Y: '+str(round(np.max(dfy)-np.mean(dfy),2))+'</td>'
print '<td>%CV Y: '+str(abs(round(100*(np.std(dfy)/np.mean(dfy)),2)))+'</td></tr>'
print '</table><br><br>'

print '<hr>Raw data:<br><br>'
#<tr><TD>GX: 45.0 GY: 86.0</td><td> IX: 42.1 IY: 88.55</td><td><font color=red> DX: 2.9 DY: -2.55</font></td><td><img src=x45.0y86.0.png></td></tr>

print '<form target="_blank" action="coordslist.php" method="POST">'
print '<input type=submit>'
print ' Select all wells: <input type=checkbox name=allwell value=all>'
rows = []
for i in data:
	rows.append(i['row'])
rows = np.unique(np.array(rows))
rct = 0
for i in rows:
	rct = rct + 1
	print str(rct)+': <input type=checkbox name=selrows value='+str(rct)+'> '
print '<br><br>';


print '<table border=1><tr>'
print '<td>Row,Col</td>'
print '<td>Gcode position</td>'
print '<td>Spot center position</td>'
print '<td>Image detection position</td>'
print '<td>Difference</td>'
print '<td>Image</td>'
print '<td>Ideal Image</td>'
print '<td>Select Teaching Well</td>'
print '<td>Test</td>'
print '</tr>'
ct = 0
for i in datlist:
	i = re.sub('<\/tr>', '', i)
	da = data[ct]
	dx = dfx[ct]
	dy = dfy[ct]
	modx= round(float(da['x']) + float(da['ix'] - da['px']),2)
	mody= round(float(da['y']) + float(da['iy'] - da['py']),2)
	i = i + '<td><input type="checkbox" name="well[]" value="'+str(ct)+'"> Change?'
	i = i +'<br>X: <input type="text" name="manxval[]" value="'+str(modx)+'" size=8>'
	i = i +'<br>Y: <input type="text" name="manyval[]" value="'+str(mody)+'" size=8>'
	i = i +'</font></td>'
	if abs(dx)>0.05:
		i = i +'<td><font color=red>X</font></td></tr>'
	elif abs(dy)>0.05:
		i = i +'<td><font color=red>X</font></td></tr>'
	else:
		i = i +'<td><font color=blue>pass</font></td></tr>'
	print i
	ct = ct+1
print '</table>'
print '</form>'
print '</font></body>'
print '</html>'

file_path = os.path.join(CURRENT_DIR, 'dataset')
aa = open(file_path,'w')
aa.write(json.dumps(data))
aa.close()

