#!/usr/bin/env bash
# arg 1: Music service: "local" or "rainwave"

# Define constants for scene and source labels
music_scene="[A] Music Scene"
local_music_scene="[A] Local Music Wrapper Scene"
rainwave_music_scene="[A] Rainwave Music Wrapper Scene"

music_source=$1
echo "Command-line argument 1: $music_source"

case $music_source in 

    "local")
        target_scene=$local_music_scene
        hide_scene=$rainwave_music_scene
        ;;
    "rainwave")
        target_scene=$rainwave_music_scene
        hide_scene=$local_music_scene
    ;;
esac

# perform music switch
obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$target_scene\""', "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$music_scene\""', "item": '"\"$hide_scene\""', "visible": false}'
