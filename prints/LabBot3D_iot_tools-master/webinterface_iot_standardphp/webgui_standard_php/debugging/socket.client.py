import telnetlib
import time     
import sys      
                

tn= telnetlib.Telnet('192.168.1.3', 8888)
cmd = sys.argv[1]
                
tn.write(cmd)
resp = tn.read_until('ok', 3)
#time.sleep(1)
print resp     
tn.close()
