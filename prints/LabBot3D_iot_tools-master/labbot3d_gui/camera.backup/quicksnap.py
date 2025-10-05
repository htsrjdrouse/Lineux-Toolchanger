import os,sys,time

cmd = 'raspistill -o /home/pi/'+sys.argv[1]+'.jpg -ex sports --nopreview --timeout 1'
print cmd
os.system(cmd)
