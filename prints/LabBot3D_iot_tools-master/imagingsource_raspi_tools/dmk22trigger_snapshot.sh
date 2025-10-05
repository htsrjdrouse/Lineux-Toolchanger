#!/bin/sh
rm trigger.jpg
v4l2-ctl -c exposure_absolute=303,gain=144,privacy=1
gst-launch-0.10 v4l2src ! video/x-raw-gray,width=744,height=480,framerate=15/1 ! tisvideobufferfilter ! ffmpegcolorspace ! video/x-raw-yuv ! jpegenc quality=50 ! filesink location="trigger.jpg"
#gst-launch-0.10 v4l2src ! video/x-raw-gray,width=744,height=480,framerate=15/1 ! tisvideobufferfilter ! ffmpegcolorspace ! video/x-raw-yuv ! jpegenc quality=50 ! multifilesink max-files=2 location="trigger%d.jpg"
#gst-launch-0.10 v4l2src ! video/x-raw-gray,width=744,height=480,framerate=15/1 ! tisvideobufferfilter ! ffmpegcolorspace ! video/x-raw-yuv ! jpegenc quality=50 ! multifilesink location="trigger%d.jpg"
