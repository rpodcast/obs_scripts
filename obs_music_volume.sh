#!/usr/bin/env bash
# arg 1: Volume direction: "down" or "up" or "target"
# arg 2: Number. If direction is down/up, then number is the amount to increase/decrease (depending on direction)
#                If direction is "target", then number is the final volume to target. Note number must be <= 0
#
# floating point functions from https://www.linuxjournal.com/content/floating-point-math-bash

# Define constants for scene and source labels
music_scene="[A] Music Scene"
local_music_scene="[A] Local Music Wrapper Scene"
local_music_source="[LOCAL] MPD Music Source"
rainwave_music_scene="[A] Rainwave Music Wrapper Scene"
rainwave_music_source="[BROWSER] Rainwave Music Source"

direction=$1
delta=$2
echo "Command-line argument 1: $direction"
echo "Command-line argument 2: $delta"

# determine which music scene is active
local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$local_music_scene\""'}' | jq '.[0]' | jq '.visible')

rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$rainwave_music_scene\""'}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    current_source=$local_music_source
fi

if $rainwave_visible
then
    current_source=$rainwave_music_source
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
