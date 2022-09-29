#!/usr/bin/env bash
# arg 1: Volume direction: "down" or "up" or "target"
# arg 2: Number. If direction is down/up, then number is the amount to increase/decrease (depending on direction)
#                If direction is "target", then number is the final volume to target. Note number must be <= 0
#
# floating point functions from https://www.linuxjournal.com/content/floating-point-math-bash

# Define constants for scene and source labels
mic_scene="[A] Microphone Scene"
mic_filter_source="[LOCAL] Microphone Source"
mic_raw_source="[LOCAL] Microphone No Filters"

direction=$1
delta=$2
#echo "Command-line argument 1: $direction"
#echo "Command-line argument 2: $delta"

# determine which microphone source is active
mic_filter_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$mic_scene\""', "item": '"\"$mic_filter_source\""'}' | jq '.[0]' | jq '.visible')
mic_raw_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$mic_scene\""', "item": '"\"$mic_raw_source\""'}' | jq '.[0]' | jq '.visible')

echo $mic_filter_visible
echo $mic_raw_visible

if $mic_filter_visible
then
    current_source=$mic_filter_source
fi

if $mic_raw_visible
then
    current_source=$mic_raw_source
fi

# obtain current volume
current_volume=$(obs-cli-js GetVolume='{"source": "'"$current_source"'", "useDecibel": true}' | jq '.[0]' | jq '.volume')
echo $current_volume

# TODO enable volume modification like below
# TODO write volume value to text file so I can display as an obs scene

# calculate new volume
case $direction in 

    "down")
        new_volume=$(echo "$current_volume-$delta" | bc)
        ;;
    "up")
        new_volume=$(echo "$current_volume+$delta" | bc)
        ;;
    "target")
        new_volume=$delta
        ;;
        
esac

# set new volume
obs-cli-js SetVolume='{"source": "'"$current_source"'", "volume": '${new_volume}', "useDecibel": true}'

# output current volume to text file
final_volume=$(obs-cli-js GetVolume='{"source": "'"$current_source"'", "useDecibel": true}' | jq '.[0]' | jq '.volume')
echo $final_volume > /media/media_drive1/obs_files/text_assets/mic_volume.txt