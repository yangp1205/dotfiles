#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
nm-applet &
fcitx &
volumeicon &
/bin/bash ~/scripts/setxmodmap-code.sh &
~/scripts/autostart_wait.sh &
