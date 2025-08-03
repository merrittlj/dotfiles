#!/bin/bash

#setxkbmap -layout us -variant dvp -option ctrl:swapcaps &
# do not include sxhkd here, do it in berry autostart
feh --randomize --recursive --bg-fill ~/wallpapers &
xrdb -merge ~/.Xresources
urxvtd -q -o -f &
exec berry
