import telnetlib
import sys
tn = telnetlib.Telnet('192.168.122.101', 8888)
cmd = sys.argv[1]
tn.write(cmd)
resp = tn.read_until('ok', 1)
print resp
