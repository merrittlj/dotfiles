#!/usr/local/bin/fish
set mode $1
if test -z mode
    grep "file" ~/.config/nitrogen/bg-saved.cfg | sed "s/file=//"
else if test mode = "s"
    nitrogen --random "$WALLPAPERS_PATH" --set-zoom-fill --save
else if test mode = "r"
    rm "$(bt)"
    bt s
end
