#!/usr/bin/env bash

# arg 1: camera position: "ur" for upper right, "lr" for lower right, "ul" for upper left, "ll" for lower left

#SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'

camera_position=$1

# obtain current scene name
current_scene=$(obs-cli-js GetCurrentScene | jq '.[0]' | jq '.name')
echo $current_scene
sleep 0.1
case $camera_position in

    "ur")
        obs-cli-js SetSourceFilterVisibility='{"sourceName": '"$current_scene"', "filterName": "Camera Upper Right", "filterEnabled": true}'
        ;;
    
    "lr")
        obs-cli-js SetSourceFilterVisibility='{"sourceName": '"$current_scene"', "filterName": "Camera Lower Right", "filterEnabled": true}'
        ;;

    "ul")
        obs-cli-js SetSourceFilterVisibility='{"sourceName": '"$current_scene"', "filterName": "Camera Upper Left", "filterEnabled": true}'
        ;;
    
    "ll")
        obs-cli-js SetSourceFilterVisibility='{"sourceName": '"$current_scene"', "filterName": "Camera Lower Left", "filterEnabled": true}'
        ;;
esac

