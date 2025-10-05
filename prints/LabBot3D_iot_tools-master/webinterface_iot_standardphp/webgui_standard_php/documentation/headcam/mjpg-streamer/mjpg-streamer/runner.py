import os

# Get path of the current dir, then use it to create paths:
CURRENT_DIR = os.path.dirname(__file__)
file_path = os.path.join(CURRENT_DIR, 'command.that.works')


os.system('./mjpg_streamer -i "./input_uvc.so -y -d /dev/video0 -r 352x288" -o "./output_http.so -w ./www -p 8080"')
   

