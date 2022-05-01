#!/usr/bin/env bash

# toggle mute
obs-cli-js ToggleMute='{"source": "[A] Microphone Scene Source"}'

# obtain mute status
mic_muted=$(obs-cli-js GetMute='{"source": "[A] Microphone Scene Source"}' | jq '.[0]' | jq '.muted')

# show overlay if muted
if $mic_muted
then
    obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Mic Mute Overlay", "visible": true}'
else
    obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Mic Mute Overlay", "visible": false}'
fi
