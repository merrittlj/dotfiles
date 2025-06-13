#!/usr/bin/env fish

echo $fish_pid >> /tmp/berry-clean.pid

function clock
	echo -n (date "+%R")
end

function battery
	set charge_now (cat /sys/class/power_supply/BAT0/charge_now)
	set charge_full (cat /sys/class/power_supply/BAT0/charge_full)
	math -s0 "($charge_now / $charge_full) * 100"
end

function virtual
	set current_desktop (xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	if test $current_desktop = 0
		echo -n "o||"
	else if test $current_desktop = 1
		echo -n "|o|"
	else if test $current_desktop = 2
		echo -n "||o"
	end
end

while true
	echo "%{c}"(clock)" "(battery)"%% "(virtual)
	sleep .1
end
