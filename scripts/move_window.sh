#!/bin/sh
tce-load -i xdotool.tcz

windowID=$(xdotool search --onlyvisible --name mplayer)
xdotool windowmove $windowID 0 0

