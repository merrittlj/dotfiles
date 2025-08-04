#!/usr/bin/env fish

echo $fish_pid >> /tmp/berry-clean.pid

function sigusr1_handler --on-signal USR1
	stdbuf -o0 ~/scripts/grabkeys 2>/dev/null
end

while true
	set clock (date "+%R")

	#set charge_now (cat /sys/class/power_supply/BAT0/charge_now)
	#set charge_full (cat /sys/class/power_supply/BAT0/charge_full)
	#set battery (math -s0 "($charge_now / $charge_full) * 100")

	set current_desktop (xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	set virtual (math "$current_desktop + 1")

	echo "$clock [$virtual]"
	sleep .1
end
