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

#source_browser="[B] Web Browser Scene"
#source_vscode="[B] VSCode Scene"
#source_gitkraken="[B] GitKraken Scene"
#source_desktop="[B] Desktop Scene"

#echo $source_scene_nochat

wm_left=0
wm_up=1090
wm_width_narrow=1520
wm_width_full=1918
wm_height=1079


# obtain current scene name
current_scene=$(obs-cli GetCurrentScene | jq '.[0]' | jq '.name')
echo $current_scene
sleep 0.1
case $current_scene in

    '"[*] Source Demonstration"')
        # resize vscode
        
        /usr/bin/wmctrl -r code -e 0,0,1090,1918,1079

        # resize Firefox
        /usr/bin/wmctrl -r Firefox -e 0,0,1090,1918,1079

        # resize gitkraken
        #/usr/bin/wmctrl -r GitKraken -e 0,0,1090,1918,1079
        ;;
    
    '"[*] Source Demonstration with Chat"')
        # resize vscode
        /usr/bin/wmctrl -r code -e 0,0,1090,1520,1079

        # resize Firefox
        /usr/bin/wmctrl -r Firefox -e 0,0,1090,1520,1079

        # resize gitkraken
        #/usr/bin/wmctrl -r GitKraken -e 0,0,1090,1520,1079
        ;;
esac
