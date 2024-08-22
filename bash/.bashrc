# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
PS1='[\w]\$ '

export SALAMANDER_ROOT=~/programming/graphics/salamander-engine
export BEMENU_PATH=/home/lucas/.config/bemenu
export THEME_PATH=/home/lucas/.local/share/theme/
export BRAWLHALLA_RUNNER_PATH=/home/lucas/programming/misc/bots/brawlhalla-bot/runner

function gr {
	grep -r -n -H -C 3 $1 $2
}

function term {
	kitty
}

function javapaste {
	echo
	for file in *.java;
	do
		echo "// $file"
		cat $file
		echo
	done
}

function battery {
	# acpi | grep -o '[0-9]*%' | sed 's/[^0-9]//g'
	# cat /sys/class/power_supply/BAT0/capacity
	echo "$(echo $(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full) | bc -l) * 100" | bc -l | xargs printf %.2f
	echo
}

function batterylife {
	echo $(cat /sys/class/power_supply/BAT0/charge_full) / $(cat /sys/class/power_supply/BAT0/charge_full_design) | bc -l
}

function batterye {
	ratpoison -c "echo $(cat /sys/class/power_supply/BAT0/status) $(battery)%"
}

function menu {
	$BEMENU_PATH/bemenu-run -p bemenu --fn "ProFontOTB 22" --binding vim --border 2 --prefix -- --margin 100 --center --fixed-height --counter always --list "10 up" --single-instance --tb "#000000" --tf "#ffffff" --fb "#ffffff" --ff "#000000" --nb "#ffffff" --nf "#000000" --hb "#ffffff" --hf "##005e8b" --fbb "#ffffff" --fbf "#000000" --sb "#ffffff" --sf "#000000" --ab "#ffffff" --af "#000000" --scb "#ffffff" --scf "#000000" --bdr "#000000"
}

function setbg {
	nitrogen --random ~/wallpapers --set-zoom-fill --save
}

function curbg {
	grep "file" ~/.config/nitrogen/bg-saved.cfg | sed "s/file=//"
}

function rmbg {
	rm $(curbg)
	setbg
}

function btul {
	export BW_SESSION=$(bw unlock --raw)
}

function cura {
	/home/lucas/builds/UltiMaker-Cura-5.8.0-linux-X64.AppImage -platformtheme gtk3
}

function uztd {
	ls *.zip | awk -F'.zip' '{print "unzip "$0" -d "$1}' | sh
}

function kicad {
	export GDK_SCALE=2
	command kicad
}

export -f gr
export -f term
export -f javapaste
export -f battery
export -f batterylife
export -f batterye
export -f menu
export -f setbg
export -f rmbg
export -f curbg
export -f btul
export -f cura
export -f uztd
export -f kicad

PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export XAUTHORITY=/home/lucas/.Xauthority

export oc=/home/lucas/programming/embedded/ocelot
export dh=/home/lucas/programming/embedded/dash
export la=/home/lucas/.local/share/Terraria/tModLoader/ModSources/LukaiAddons
export tm=/home/lucas/second-hd/SteamLibrary/steamapps/common/tModLoader

export ANDROID_HOME="${HOME}/android"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools";
export PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/bin";
export CLANGD_FLAGS="--query-driver='/usr/bin/arm-none-eabi-*'"
