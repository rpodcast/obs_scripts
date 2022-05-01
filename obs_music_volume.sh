#!/usr/bin/env bash
# arg 1: Volume direction: "down" or "up" or "target"
# arg 2: Number. If direction is down/up, then number is the amount to increase/decrease (depending on direction)
#                If direction is "target", then number is the final volume to target. Note number must be <= 0
#
# floating point functions from https://www.linuxjournal.com/content/floating-point-math-bash

direction=$1
delta=$2
echo "Command-line argument 1: $direction"
echo "Command-line argument 2: $delta"

# determine which music scene is active
local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Local Music Scene"}' | jq '.[0]' | jq '.visible')
rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene"}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    current_source="[A] MPD Audio Output Source"
fi

if $rainwave_visible
then
    current_source="[B] Rainwave Music Source"
fi

# obtain current volume
current_volume=$(obs-cli-js GetVolume='{"source": "'"$current_source"'", "useDecibel": true}' | jq '.[0]' | jq '.volume')
echo $current_volume

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
