#!/usr/bin/env bash
# arg 1: animation / alert
# possible values
# - "story time"
# - "charity"
ANIMATION=$1

# obtain current scene name
current_scene=$(obs-cli-js GetCurrentScene | jq '.[0] .name')

case $ANIMATION in

    "story time")
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Empty Book Source", "visible": true}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Story Time Text", "visible": true}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Adam Cole Image", "visible": true}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Story Time Alert", "visible": true}' 

        sleep 1
        
        # play audio (comment out if using Aitum instead)
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Story Time Audio", "visible": true}' 

        sleep 2
        
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] R-Podcast Text", "visible": true}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Jesse Image Source", "visible": true}'

        sleep 2

        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Baby Text", "visible": true}'

        sleep 7

        echo "ended sleep"

        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Story Time Alert", "visible": false}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Story Time Audio", "visible": false}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Story Time Text", "visible": false}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Adam Cole Image", "visible": false}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] R-Podcast Text", "visible": false}' 
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Jesse Image Source", "visible": false}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Baby Text", "visible": false}'
        obs-cli-js SetSceneItemProperties='{"scene-name": "[ANI] Story Time Alert", "item": "[LOCAL] Empty Book Source", "visible": false}' 
        ;;
        
    "charity")
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Charity Stream Overlay", "visible": true}'
        sleep 8
        obs-cli-js SetSceneItemProperties='{"scene-name": "[B] Animations Scenes", "item": "[ANI] Charity Stream Overlay", "visible": false}'
        ;;
esac
