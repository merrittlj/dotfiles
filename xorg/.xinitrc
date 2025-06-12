#!/bin/bash

setxkbmap -layout us -variant dvp -option ctrl:swapcaps &
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
exec berry
