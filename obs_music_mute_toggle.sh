#!/usr/bin/env bash

# determine which music scene is active
local_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Local Music Scene"}' | jq '.[0]' | jq '.visible')
rainwave_visible=$(obs-cli-js GetSceneItemProperties='{"scene-name": "[B] Music Scene", "item": "[B] Rainwave Music Scene"}' | jq '.[0]' | jq '.visible')

echo $local_visible
echo $rainwave_visible

if $local_visible
then
    obs-cli-js ToggleMute='{"source": "[A] MPD Audio Output Source"}'
fi

if $rainwave_visible
then
    obs-cli-js ToggleMute='{"source": "[B] Rainwave Music Source"}'
fi
