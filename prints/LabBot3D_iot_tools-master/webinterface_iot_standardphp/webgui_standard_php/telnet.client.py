import telnetlib
tn = telnetlib.Telnet('localhost', 8888)
tn.write('help')
resp = tn.read_until('ok', 1)
print resp
