import sys
import telnetlib
tn = telnetlib.Telnet('localhost', 8888)
tn.write(sys.argv[1])
resp = tn.read_until('ok', 1)
print resp
