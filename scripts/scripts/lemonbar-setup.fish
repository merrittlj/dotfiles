#!/usr/bin/env fish

set resolution (xrandr | awk '/\*/ {print $1}' | head -n1)
set width (string split x $resolution)[1]
set height (string split x $resolution)[2]
set barwidth $width
set barheight 30
set desx 0
set desy (math $height - $barheight)

fish -c "fish ~/scripts/lemonbar.fish | lemonbar -g '$barwidth'x'$barheight'+'$desx'+'$desy' -B#372640 -F#bfbaac -f 'Fantasque Sans Mono-8'" &
#fish -c "sleep 1s && fish ~/scripts/lemonbar-above.fish" &
