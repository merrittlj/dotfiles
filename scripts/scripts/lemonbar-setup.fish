#!/usr/bin/env fish

set barwidth 300
set barheight 75
set resolution (xrandr | awk '$0 ~ "*" {print $1}')
set width (string split x $resolution)[1]
set height (string split x $resolution)[2]
set desx (math $width - 100 - $barwidth)
#set desy (math $height - 50 - $barheight)
set desy 50
fish -c "fish ~/scripts/lemonbar.fish | lemonbar -g '$barwidth'x'$barheight'+'$desx'+'$desy' -B#372640 -F#bfbaac -f 'Fantasque Sans Mono-14'" &
fish -c "sleep 1s && fish ~/scripts/lemonbar-above.fish" &
