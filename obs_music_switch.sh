#!/usr/bin/env bash
# arg 1: Music service: "local" or "rainwave"

music_source=$1
echo "Command-line argument 1: $music_source"

case $music_source in 

    "local")
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Local Music Scene", "visible": true}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene", "visible": false}'
        ;;
    "rainwave")
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Local Music Scene", "visible": false}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene", "visible": true}'
    ;;
esac
