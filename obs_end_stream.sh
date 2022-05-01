#!/usr/bin/env bash

#obs-cli SetCurrentScene='{"scene-name": "[*] Closing Scene General"}'
obs-cli scene current "[*] Closing Scene General"
sleep 6
obs-cli scene current "[*] Collage Closing"
sleep 2
# obtain status of streaming
streaming_status=$(obs-cli-js GetStreamingStatus | jq '.[0]' | jq '.streaming')
#streaming_status=$(obs-cli stream status | cut -d':' -f2 | tr -d '[:space:]')
echo $streaming_status

sleep 1

if [ $streaming_status == "true" ]
then
    obs-cli stream stop
    sleep 4
fi

#recording_status=$(obs-cli GetRecordingStatus | jq '.[0]' | jq '.isRecording')
recording_status=$(obs-cli recording status | head -n 1 | cut -d':' -f2 | tr -d '[:space:]')
echo $recording_status

sleep 1

if [ $recording_status == "true" ]
then
    obs-cli recording stop
    sleep 2
fi

# move windows from virtual display back to main monitor
# apps for virtual display
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "GitKraken" "DP-2" 0 900 600
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Visual Studio Code" "DP-2" 0 1920 1080
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Firefox" "DP-2" 0 1920 1080

# re-route audio sinks
# move audio sinks
"${HOME}"/scripts/obs_scripts/sink-move.sh "Music Player Daemon" "alsa_output.usb-Corsair_CORSAIR_VOID_ELITE_Wireless_Gaming_Dongle-00.analog-stereo"
"${HOME}"/scripts/obs_scripts/sink-move.sh "Chromium" "alsa_output.usb-Corsair_CORSAIR_VOID_ELITE_Wireless_Gaming_Dongle-00.analog-stereo"
"${HOME}"/scripts/obs_scripts/sink-move.sh "Firefox" "alsa_output.usb-Corsair_CORSAIR_VOID_ELITE_Wireless_Gaming_Dongle-00.analog-stereo"