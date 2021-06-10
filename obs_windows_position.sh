#!/usr/bin/env bash

# arg 1: program name: "code" or "brave" or "GitKraken" or "desktop"

# test getting vscode window in right dimensions

#---------------------------------------------------------------------
# examples when 1080p monitor is on left and 4k monitor is on right
#---------------------------------------------------------------------
#wmctrl -r code -e 0,1920,20,1520,1080
#wmctrl -r code -e 0,1920,20,1920,1080
#wmctrl -r "RStudio Server" -e 0,3840,20,1520,1080
#wmctrl -r "RStudio Server" -e 0,3840,20,1920,1080
#wmctrl -r GitKraken -e 0,1920,1000,1520,1080
#wmctrl -r GitKraken -e 0,1920,1000,1920,1080

#----------------------------------------------------------------------
# examples when 1080p monitor is on right and 4k monitor is on left
#----------------------------------------------------------------------
#wmctrl -r code -e 0,0,20,1520,1080
#wmctrl -r brave -e 0,1920,20,1520,1080
#wmctrl -r brave -e 0,1920,1000,1920,1080
#wmctrl -r "RStudio Server" -e 0,1920,20,1520,1080
#wmctrl -r GitKraken -e 0,1920,1000,1520,1080
#wmctrl -r GitKraken -e 0,1920,1080,1920,1080

#source_select=$1

# define scenes that are able to show a window source of a program
source_scene_nochat='"[*] Source Demonstration"'
source_scene_chat='"[*] Source Demonstration with Chat"'

source_browser="[B] Web Browser Scene"
source_vscode="[B] VSCode Scene"
source_gitkraken="[B] GitKraken Scene"
source_desktop="[B] Desktop Scene"

#echo $source_scene_nochat

# obtain current scene name
current_scene=$(obs-cli GetCurrentScene | jq '.[0]' | jq '.name')
echo $current_scene

case $current_scene in

    '"[*] Source Demonstration"')
        # resize vscode
        wmctrl -r code -e 0,1920,20,1920,1080

        # resize rstudio
        wmctrl -r "RStudio Server" -e 0,3840,20,1920,1080

        # resize brave
        #wmctrl -r Firefox -e 0,1920,20,1920,1080

        # resize gitkraken
        wmctrl -r GitKraken -e 0,1920,1080,1920,1080
        ;;
    
    '"[*] Source Demonstration with Chat"')
        # resize vscode
        wmctrl -r code -e 0,1920,20,1520,1080

        # resize rstudio
        wmctrl -r "RStudio Server" -e 0,3840,20,1520,1080

        # resize brave
        #wmctrl -r Firefox -e 0,1920,20,1520,1080

        # resize gitkraken
        wmctrl -r GitKraken -e 0,1920,1080,1520,1080
        ;;
esac
