#!/bin/sh
windowID=$(xdotool search --onlyvisible --name mplayer)
xdotool windowmove $windowID 0 0

