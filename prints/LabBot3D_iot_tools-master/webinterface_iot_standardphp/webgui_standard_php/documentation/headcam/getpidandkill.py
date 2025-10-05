import re, os


os.system('ps aux | grep -m 1 mjpg-streamer/mjpg-streamer/mjpg_streamer  > pidfile')

pf = open('pidfile')

#root     25949  0.1  0.3   5116  1596 ?        S    22:49   0:00 sudo /home/richard/mjpg-streamer/mjpg-streamer/mjpg_streamer -i /home/richard/mjpg-streamer/mjpg-streamer/input_uvc.so -n -r 320x240 -f 10 -o /home/richard/mjpg-streamer/mjpg-streamer/output_http.so -p 8080 -w /home/richard/mjpg-streamer/mjpg-streamer/www


for i in pf:
	print i
	f =re.split('\s+', i)
	os.system('kill ' +f[1])

