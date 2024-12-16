#!/usr/bin/env bash

# Define constants for scene and source labels
mic_source="[A] Microphone Scene Source"
overlay_scene="[B] Animations Scenes"
mute_scene="[ANI] Mic Mute Overlay"

# toggle mute
obs-cli-js ToggleMute='{"source": '"\"$mic_source\""'}'

# obtain mute status
mic_muted=$(obs-cli-js GetMute='{"source": '"\"$mic_source\""'}' | jq '.[0]' | jq '.muted')

# show overlay if muted
if $mic_muted
then
    obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$overlay_scene\""', "item": '"\"$mute_scene\""', "visible": true}'
else
    obs-cli-js SetSceneItemProperties='{"scene-name": '"\"$overlay_scene\""', "item": '"\"$mute_scene\""', "visible": false}'
fi
