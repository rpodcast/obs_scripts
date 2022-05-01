#!/usr/bin/env bash

# launch all key apps
"${HOME}"/scripts/obs_scripts/launch_screencast_apps.sh

# change to starting scene
obs-cli scene current "[*] Only Me Screencast"
sleep 1

# start recording
obs-cli recording start

notify-send --expire-time=1000 --icon=info "Recording now!"