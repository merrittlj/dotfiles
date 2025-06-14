#!/usr/bin/env fish

set color1 "#372640"
set color2 "#bfbaac"
set accent "#b08500"
set font "Fantasque Sans Mono 24"

bemenu-run -p bemenu --fn $font --border 2 --prefix -- --margin 100 --center --fixed-height --counter always --list "10 down" --single-instance --tb $color2 --tf $color1 --fb $color1 --ff $color2 --nb $color1 --nf $color2 --hb $color1 --hf $accent --fbb $color1 --fbf $color2 --sb $color1 --sf $color2 --ab $color1 --af $color2 --scb $color1 --scf $color2 --bdr $color2 
