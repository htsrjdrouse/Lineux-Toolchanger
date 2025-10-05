<?php

$cmd = 'sudo /home/richard/mjpg-streamer/mjpg-streamer/mjpg_streamer -i "/home/richard/mjpg-streamer/mjpg-streamer/input_uvc.so -n -r 320x240 -f 10" -o "/home/richard/mjpg-streamer/mjpg-streamer/output_http.so -p 8080 -w /home/richard/mjpg-streamer/mjpg-streamer/www" > /dev/null &';

exec($cmd);
?>
