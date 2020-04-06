#!/bin/bash

ICON=~/.config/i3/icon.png
TMPBG=/tmp/screen.png
# scrot to take screenshots
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
playerctl pause
i3lock -u -i $TMPBG
rm $TMPBG 
