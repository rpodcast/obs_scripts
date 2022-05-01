#!/usr/bin/env bash

# arg 1: program name: "vscode" or "brave" or "GitKraken" or "desktop" or "rstudio" or "virtual"

# test getting vscode window in right dimensions
#wmctrl -r code -e 0,0,20,1520,1080
#wmctrl -r brave -e 0,1920,20,1520,1080
#wmctrl -r brave -e 0,1920,1000,1920,1080
#wmctrl -r GitKraken -e 0,1920,1000,1520,1080
#wmctrl -r GitKraken -e 0,1920,1080,1920,1080

#SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'

source_select=$1

# define scenes that are able to show a window source of a program
source_scene_nochat="[*] Source Demonstration"
source_scene_chat="[*] Source Demonstration with Chat"
source_browser="[B] Web Browser Scene"
source_vscode="[B] VSCode Scene"
source_gitkraken="[B] GitKraken Scene"
source_desktop="[B] Desktop Scene"
source_rstudio="[B] RStudio Scene"
source_virtual="[B] Dummy Monitor Scene"

#echo $source_scene_nochat

# obtain current scene name
current_scene=$(obs-cli GetCurrentScene | jq '.[0]' | jq '.name')
echo $current_scene
sleep 0.3
case $source_select in

    "vscode")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}'
        ;;
    
    "brave")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}'
        ;;

    "GitKraken")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}'
        ;;
    
    "desktop")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}'
        #obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}'
        ;;

    "rstudio")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": false}'
        ;;
        
    "virtual")
        obs-cli SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_virtual"'", "visible": true}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_desktop"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_browser"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_gitkraken"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_vscode"'", "visible": false}' SetSceneItemProperties='{"scene-name": '"$current_scene"', "item": "'"$source_rstudio"'", "visible": false}'
        ;;
esac

