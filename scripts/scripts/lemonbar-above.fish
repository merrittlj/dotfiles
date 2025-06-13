#!/usr/bin/env fish

echo $fish_pid >> /tmp/berry-clean.pid

while true
	set bar_win (xdo id -a bar)
	set top_win (xwininfo -root -children | grep '0x' | awk '{ print $1 }' | grep -m1 '[0-9]')
	xdo above -t $top_win $bar_win
	sleep .1
end

