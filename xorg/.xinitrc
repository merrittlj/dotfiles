#!/bin/bash

#pulseaudio --start
setxkbmap -layout us -variant dvp -option ctrl:swapcaps
xbindkeys

while true
do
	#xsetroot -name "$(date '+%m|%d %H.%M')"
	xsetroot -name "$(date '+%m|%d %H.%M') $(battery | sed -E 's/([0-9]*)\..*/\1/g')%"
	sleep 1
done &
exec ratpoison >>/var/log/ratpoison.log 2>&1
