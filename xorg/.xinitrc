#!/bin/bash

pulseaudio --start
# while xsetroot -name "$(date '+%m|%d %H.%M') $(battery)%"

while true
do
	xsetroot -name "$(date '+%m|%d %H.%M')"
	sleep 1
done &
exec ratpoison >>/var/log/ratpoison.log 2>&1
