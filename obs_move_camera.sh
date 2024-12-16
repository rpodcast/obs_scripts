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
        filter_name="Camera Upper Right"
        ;;

    "lr")
        filter_name="Camera Lower Right"
        ;;

    "ul")
        filter_name="Camera Upper Left"
        ;;
    
    "ll")
        filter_name="Camera Lower Left"
        ;;
esac

obs-cli-js SetSourceFilterVisibility='{"sourceName": '"$current_scene"', "filterName": '"\"$filter_name\""', "filterEnabled": true}'

