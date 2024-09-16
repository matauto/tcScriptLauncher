tce-load -i libcamera.tcz
tce-load -i mplayer-cli.tcz
tce-load -i xdotool.tcz

#I use EyeToy camera with Intel M device without built in camera
mplayer tv:// -tv driver=v4l2:device=/dev/video0:width=640:height=480:fps=10:outfmt=mjpeg -vo x11
#-vm -x 640 -y 480 -fs
#windowID = $(xdotool search --onlyvisible --name mplayer)
#xdotool windowmove $windowID 0 0
