#!/usr/bin/env bash
# arg 1: Volume direction: "down" or "up" or "target"
# arg 2: Number. If direction is down/up, then number is the amount to increase/decrease (depending on direction)
#                If direction is "target", then number is the final volume to target. Note number must be <= 0
#
# floating point functions from https://www.linuxjournal.com/content/floating-point-math-bash

#output from pactl list short 

#67	alsa_input.usb-MOTU_M2_M20000059297-00.analog-stereo	PipeWire	s32le 2ch 48000Hz	RUNNING

#pactl set-sink-volume <index number> <volume in %>
# pactl set-sink-volume 0 100%

#pactl set-source-volume 67 100%

# to obtain the volume percentage in the current setting
# 67 is the source id of the moto m2 input I'm using
#pactl get-source-volume 67 | grep -Eo "[[:digit:]]{1,3}%" | head -1

# Define constants for pulse audio / pipewire inputs
# pactl list short sources
# then look for which index matches this entry
# alsa_input.usb-MOTU_M2_M20000059297-00.analog-stereo
moto_input_id=67

direction=$1
delta=$2

current_volume=$(pactl get-source-volume $moto_input_id | grep -Eo '[[:digit:]]{1,3}%' | head -1 | sed 's/%//')

echo $current_volume

# calculate new volume
case $direction in 

    "down")
        new_volume=$(echo "$current_volume-$delta" | bc)%
        ;;
    "up")
        new_volume=$(echo "$current_volume+$delta" | bc)%
        ;;
    "target")
        new_volume=$delta%
        ;;
        
esac

echo $new_volume

# set new volume
pactl set-source-volume $moto_input_id $new_volume

# output current volume to text file
final_volume=$(pactl get-source-volume $moto_input_id | grep -Eo '[[:digit:]]{1,3}%' | head -1 )
echo $final_volume > /media/media_drive1/obs_files/text_assets/gnome_moto_volume.txt
