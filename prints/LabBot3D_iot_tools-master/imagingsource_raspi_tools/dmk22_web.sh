#!/bin/sh
clear
echo Create a Gstreamer pipeline for DMK 22 to connect for server3.py
echo start the server3.py first, otherwise the connection is refused.
error=0

gst-inspect-0.10 --plugin tiscolorize > null
rc=$?
if test $rc != 0
then 
  echo Module tiscolorize not found.
  error=1
fi
  
gst-inspect-0.10 --plugin tis_auto_exposure  > null
rc=$?
if test $rc != 0
then 
  echo Module tis_auto_exposure not found.
  error=1  
fi

gst-inspect-0.10 --plugin ffmpegcolorspace  > null
rc=$?
if test $rc != 0
then 
  echo Module ffmpegcolorspace not found.
  error=2  
fi


if test $error -eq 0
then
  ls /dev/video*
  rc=$?
  if test $rc != 0
  then 
    echo No USB device found. Is a camera connected? 
    echo If yes, is the Linux UVC firmware installed?
    echo 
    echo See https://github.com/TheImagingSource/tiscamera/wiki/Getting-Started-with-USB-Cameras
    exit
  fi


  gst-launch-0.10 v4l2src ! video/x-raw-gray,width=744,height=480,framerate=15/1 ! tisvideobufferfilter ! queue ! tis_auto_exposure ! queue ! ffmpegcolorspace ! video/x-raw-yuv ! queue ! jpegenc quality=35 ! multipartmux boundary=spionisto ! tcpclientsink port=9999

  exit
fi
  
if test $error -eq 1  
then
  echo Are the The Imaging Source GStreamer modules downloaded and compiled?
  echo Please refer to https://github.com/TheImagingSource/tiscamera
  echo
  echo A getting started can be found at https://github.com/TheImagingSource/tiscamera/wiki/Raspberry-PI-start
  echo
  echo If the modules are compiled successfully, please check the GST_PLUGIN_PATH environment variable. May be it does
  echo not point to the path, where the modules are stored in.
  exit
fi  

if test $error -eq 2  
then
  echo Are the The  GStreamer modules installed at all? They are installed with
  echo sudo ap-get install autoconf libglib2.0 libudev-dev libgstreamer0.10 gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-tools gstreamer-plugins-base0.10-dev
  exit
fi  

