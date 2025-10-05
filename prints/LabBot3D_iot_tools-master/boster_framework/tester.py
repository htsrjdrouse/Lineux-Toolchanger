import re




# this parsers the gcode 
def coordparser(strr):
 coord = {}
 E = 0
 X = 0
 Y = 0
 Z = 0
 F = 0
 print strr
 if re.match('^.*X',strr):
  px = re.match('^.*X:(.*)', strr)
  x = re.sub('[ |Y|y|Z|z|F|f|E|e].*', '', px.group(1))
  coord['X'] = float(x)
 if re.match('^.*Y|y',strr):
  py = re.match('^.*Y:(.*)', strr)
  y = re.sub('[ |X|x|Z|z|F|f|E|e].*', '', py.group(1))
  coord['Y'] = float(y)
 if re.match('^.*Z',strr):
  pz = re.match('^.*Z:(.*)', strr)
  z = re.sub('[ |X|x|Y|y|F|f|E|e].*', '', pz.group(1))
  coord['Z'] = float(z)
 if re.match('^.*E',strr):
  pe = re.match('^.*E:(.*)', strr)
  e = re.sub('[ |X|x|Y|y|F|f|].*', '', pe.group(1))
  coord['E'] = float(e)
 return coord




#['ok C: X:0.0000 Y:0.0000 Z:0.0000 E:0.0000 \r\n', 'ok\r\n']

strr = "ok C: X:0.0000 Y:0.0000 Z:0.0000 E:0.0000 \r\n"
coord = coordparser(strr)
print coord
