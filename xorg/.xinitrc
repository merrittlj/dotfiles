#!/bin/bash

setxkbmap -layout us -variant dvp -option ctrl:swapcaps &
# do not include sxhkd here, do it in berry autostart
exec berry
