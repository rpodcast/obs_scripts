#!/usr/bin/env bash

# arg 1: Window/program name. Examples "Visual Studio Code", "Firefox", "GitKraken"
# arg 2: Display to send window. Values are "DP-2" (4k monitor), "DVI-D-0" (left HP monitor), "HDMI-0" (virtual display)
# arg 3: 
# virtual display: "HDMI-0"
# left HP monitor 1920x1080: "DVI-D-0" 
# main 4k monitor: "DP-2"

# Note: For some programs like browsers, need to right click the window and select "use application system bar"

if [ ! -z "${1}" ] || [ -z "${2}" ]; then
    window=$(wmctrl -l | grep "${1}" | cut -d" " -f1)
    echo ${window}

    if [ ! -z "$window" ]; then
        x_offset="${3}"
        x_size="${4}"
        y_size="${5}"
        x_pos=$(xrandr | grep "^$2" | cut -d"+" -f2)
        y_pos=$(xrandr | grep "^$2" | cut -d"+" -f3 | cut -d' ' -f1)
        x_pos=$((x_pos + x_offset))

        if [ ! -z "$x_pos" ]; then
            wmctrl -ir $window -b remove,maximized_vert
            wmctrl -ir $window -b remove,maximized_horz
            if [ "${x_size}" == "max" ] && [ "${y_size}" == "max" ]; then
                wmctrl -ir $window -b add,maximized_vert
                wmctrl -ir $window -b add,maximized_horz
            else 
                wmctrl -ir $window -e 0,$x_pos,$y_pos,$x_size,$y_size
            fi
        else 
            echo -e "not found monitor with given name"
        fi
    else
        echo -e "not found windows with given name"
    fi
else
    echo -e "specify window and monitor name;\nmove.sh window-name monitor-name"
fi