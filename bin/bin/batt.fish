#!/usr/local/bin/fish

# needs nitrogen
set mode $1
if test -z mode
    echo "$(echo "$(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full)" | bc -l) * 100" | bc -l | xargs printf %.2f
else if test = "life"
    echo "$(cat /sys/class/power_supply/BAT0/charge_full) / $(cat /sys/class/power_supply/BAT0/charge_full_design)" | bc -l
end
