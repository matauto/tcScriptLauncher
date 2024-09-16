tce-load -i libcamera.tcz
tce-load -i mplayer-cli.tcz
tce-load -i xdotool.tcz

#change password
pass="password"
#I use intel m device processor with 800x600 touchscreen. Channel=1 subtype=1 give 640x480@30fps(on paper). 
#I lack CPU power so i must resize window down to 80%. CPU usage drop down, because main consumer is Xorg server.
#In this script I use Imou bullet 2C
mplayer "rtsp://admin:$pass@192.168.0.108:554/cam/realmonitor?channel=1&subtype=1" -vo x11 -fps 20 -zoom -x $((8*640/10)) -y $((8*480/10))
#windowID = $(xdotool search --onlyvisible --name mplayer)
#xdotool windowmove $windowID 0 0
