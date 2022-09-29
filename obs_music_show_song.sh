#!/usr/bin/env bash

# Define constants for scene and source labels
music_scene="[A] Music Scene"
local_music_scene="[A] Local Music Wrapper Scene"
local_music_display_scene="[G] Local Music Display"
rainwave_music_scene="[A] Rainwave Music Wrapper Scene"
rainwave_music_display_scene="[G] Rainwave Display"
rainwave_music_display_source="[BROWSER] Rainwave Display Static Source"

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
