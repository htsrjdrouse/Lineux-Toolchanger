import os

# Get path of the current dir, then use it to create paths:
CURRENT_DIR = os.path.dirname(__file__)
file_path = os.path.join(CURRENT_DIR, 'command.that.works')

   
os.system('/home/richard/mjpg-streamer/mjpg-streamer/mjpg_streamer -i "/home/richard/mjpg-streamer/mjpg-streamer/input_uvc.so -n -r 320x240 -f 10" -o "/home/richard/mjpg-streamer/mjpg-streamer/output_http.so -p 8080 -w /home/richard/mjpg-streamer/mjpg-streamer/www" &')

