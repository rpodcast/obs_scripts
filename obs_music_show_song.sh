#!/usr/bin/env bash

# Define constants for scene and source labels
music_scene="[B] Music Scene"
local_music_scene="[B] Local Music Scene"
local_music_display_scene="[B] Local Music Display Scene"
rainwave_music_scene="[B] Rainwave Music Scene"
rainwave_music_display_scene="[SE] Rainwave Music Display"
rainwave_music_display_source="[SE] Rainwave Music Display Static Source"

# determine which music scene is active
local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$local_music_scene\""'}' | jq '.[0]' | jq '.visible')

rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$rainwave_music_scene\""'}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    echo "Local music source visible"
    wrapper_scene=$local_music_scene
    target_scene=$local_music_display_scene
fi

if $rainwave_visible
then
    echo "Rainwave music source visible"
    wrapper_scene=$rainwave_music_display_scene
    target_scene=$rainwave_music_display_source
fi

obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$wrapper_scene\""', "item": '"\"$target_scene\""', "visible": true}'

sleep 3

obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$wrapper_scene\""', "item": '"\"$target_scene\""', "visible": false}'
