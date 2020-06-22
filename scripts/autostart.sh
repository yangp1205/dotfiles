#!/bin/bash

#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
/bin/bash ~/scripts/wp-autochange.sh &
/bin/bash ~/scripts/dwm-status.sh &
picom -b &
#nm-applet &
fcitx -d &
volumeicon &
