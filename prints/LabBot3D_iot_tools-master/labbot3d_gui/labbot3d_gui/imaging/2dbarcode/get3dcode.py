import subprocess,os,sys
import time

#cmd = 150x120+110+60
#150x120+70+60

img = sys.argv[1]
w = str(sys.argv[2])
h = str(sys.argv[3])
mw = str(sys.argv[4])
mh = str(sys.argv[5])

cmd = "convert -crop "+w+"x"+h+"+"+mw+"+"+mh+" "+img+" atest.jpg"

#os.system("convert -crop 150x120+110+60 row12_2019-02-14-19-58-19.jpg atest.jpg")
os.system(cmd)

time.sleep(1)

output = subprocess.check_output("dmtxread atest.jpg", shell=True)
time.sleep(3)
print output
os.system('rm atest.jpg')


