import telnetlib
import time     
import sys      
                

a = open('positioning', 'w')
tn= telnetlib.Telnet('localhost', 8888)
                
cmd = sys.argv[1]
                
tn.write(cmd)
resp = tn.read_until('ok', 1)
a.write(resp)   
a.close()       
#time.sleep(1)
tn.close()
