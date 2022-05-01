#!/usr/bin/env bash

#current_scene=$(obs-cli GetCurrentScene | jq '.[0]' | jq '.name')
#echo $current_scene

# determine which music scene is active

local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Local Music Scene"}' | jq '.[0]' | jq '.visible')

rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene"}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    echo "Local music source visible"
    obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Local Music Scene", "item": "[B] Local Music Display Scene", "visible": true}'
    sleep 3
    obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Local Music Scene", "item": "[B] Local Music Display Scene", "visible": false}'
fi

if $rainwave_visible
then
    echo "Rainwave music source visible"
    obs-cli-js SetSceneItemProperties='{"scene-name": "[SE] Rainwave Music Display", "item": "[SE] Rainwave Music Display Static Source", "visible": true}'
    sleep 3
    obs-cli-js SetSceneItemProperties='{"scene-name": "[SE] Rainwave Music Display", "item": "[SE] Rainwave Music Display Static Source", "visible": false}'
fi

#obs-cli GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene"}'


#obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "[B] Local Music Display Scene", "visible": true}'
#sleep 3
#obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "[B] Local Music Display Scene", "visible": false}'
