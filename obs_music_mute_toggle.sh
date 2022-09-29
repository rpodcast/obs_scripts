#!/usr/bin/env bash

# Define constants for scene and source labels
music_scene="[A] Music Scene"
local_music_scene="[A] Local Music Wrapper Scene"
local_music_source="[LOCAL] MPD Music Source"
rainwave_music_scene="[A] Rainwave Music Wrapper Scene"
rainwave_music_source="[BROWSER] Rainwave Music Source"

# determine which music scene is active
local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$local_music_scene\""'}' | jq '.[0]' | jq '.visible')

rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$rainwave_music_scene\""'}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    target_source=$local_music_source
fi

if $rainwave_visible
then
    target_source=$rainwave_music_source
fi

obs-cli-js ToggleMute='{"source": '"\"$target_source\""'}'