#!/usr/bin/env bash

# resize vscode
#/usr/bin/wmctrl -r code -e 0,0,1090,1520,1079

window=$(wmctrl -l | grep "Firefox" | cut -d" " -f1)
echo ${window}

xwininfo -id $window

# firefox offset 0
# x_size 