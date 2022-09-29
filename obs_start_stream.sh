#!/usr/bin/env bash

# arg 1: Stream platform: "YouTube" or "Twitch"
# arg 2: Stream type: "shiny" or "rpodcast"

# import stream key from file
source /home/eric/scripts/obs_scripts/stream_keys.env

set_stream_service=$1
stream_type=$2
echo "Command-line argument 1: $set_stream_service"
echo "Command-line argument 2: $stream_type"

#echo $YOUTUBE_STREAM_KEY
#echo $TWITCH_STREAM_KEY

# launch all key apps
"${HOME}"/scripts/obs_scripts/launch_streaming_apps.sh narrow

# obtain status of streaming
#streaming_status=$(obs-cli-js GetStreamingStatus | jq '.[0]' | jq '.streaming')
streaming_status=$(obs-cli stream status | cut -d':' -f2 | tr -d '[:space:]')
echo $streaming_status

if [ $streaming_status == "true" ]
then
    notify-send --expire-time=1000 --icon=info "Already streaming!"
    exit 1
fi

# set the scene to collage
# obs-cli-js SetCurrentScene='{"scene-name": "[*] Collage"}'
obs-cli scene current "[*] Collage"
sleep 1

# move audio devices to dedicated sinks
#"${HOME}"/scripts/obs_scripts/sink-move.sh "Music Player Daemon" "Music"

# obtain status of recording
#recording_status=$(obs-cli-js GetRecordingStatus | jq '.[0]' | jq '.isRecording')
recording_status=$(obs-cli recording status | head -n 1 | cut -d':' -f2 | tr -d '[:space:]')
sleep 1
echo $recording_status

# obtain current stream settings
current_stream_settings=$(obs-cli-js GetStreamSettings | jq '.[0]' | jq '.settings')
sleep 1
#echo $current_stream_settings

current_stream_service=$(echo "$current_stream_settings" | jq '.service')
#echo $current_stream_service

if [ $set_stream_service == "YouTube" ]
then
    if [ "$current_stream_service" == '"Twitch"' ]
    then
        notify-send --expire-time=1000 --icon=info "Setting YouTube"
        obs-cli-js SetStreamSettings='{"type": "rtmp_common", "settings": {"key": "'"$YOUTUBE_STREAM_KEY"'", "server": "rtmps://a.rtmps.youtube.com:443/live2", "service": "YouTube / YouTube Gaming" } }'
        sleep 1
    else
        echo "Already on YouTube, no settings need to be updated"
    fi

    obs-cli sceneitem show "[AUTO] Only Me Welcome Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    obs-cli sceneitem show "[AUTO] Only Me with Chat Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    obs-cli sceneitem show "[AUTO] Source Demonstration with Chat Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    obs-cli sceneitem show "[AUTO] Source Demonstration Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    obs-cli sceneitem show "[AUTO] Closing Scene Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"

    sleep 1
fi

if [ $set_stream_service == "Twitch" ]
then
    if [ "$current_stream_service" == '"YouTube / YouTube Gaming"' ]
    then
        notify-send --expire-time=1000 --icon=info "Setting Twitch"
        obs-cli-js SetStreamSettings='{"type": "rtmp_common", "settings": {"key": "'"$TWITCH_STREAM_KEY"'", "server": "auto", "service": "Twitch" } }'
        sleep 1
    else
        echo "Already on Twitch, no settings need to be updated"
    fi

    #obs-cli sceneitem hide "[AUTO] Only Me Welcome Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    #obs-cli sceneitem hide "[AUTO] Only Me with Chat Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    #obs-cli sceneitem hide "[AUTO] Source Demonstration with Chat Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    #obs-cli sceneitem hide "[AUTO] Source Demonstration Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"
    #obs-cli sceneitem hide "[AUTO] Closing Scene Subscribe Alert" "[LOCAL] Subscribe Widget Scene Source"

    sleep 1
fi

notify-send --expire-time=1000 --icon=info "Finished stream setting"

sleep 2

# move audio sinks
#"${HOME}"/scripts/obs_scripts/sink-move.sh "Music Player Daemon" "Music"
#"${HOME}"/scripts/obs_scripts/sink-move.sh "Chromium" "Discord"
#"${HOME}"/scripts/obs_scripts/sink-move.sh "Firefox" "Web"

notify-send --expire-time=1000 --icon=info "Finished audio sink routes"

# start streaming
obs-cli stream start

sleep 3

# start recording
obs-cli recording start

sleep 3
if [ $stream_type == "shiny" ]
then
    #obs-cli-js SetCurrentScene='{"scene-name": "[*] Intro Scene Shiny"}'
    obs-cli scene current "[*] Intro Scene Shiny"
elif [ $stream_type == "rpodcast" ]
then
    #obs-cli-js SetCurrentScene='{"scene-name": "[*] Intro Scene RPodcast"}'
    obs-cli scene current "[*] Intro Scene RPodcast"
fi

# stop current song if playing
/usr/bin/mpc stop
sleep 0.5

# clear song queue
/usr/bin/mpc clear
sleep 0.5

# load playlist
/usr/bin/mpc load livestream_starting_soon
sleep 0.5

# shuffle song order
/usr/bin/mpc shuffle
sleep 0.5

# start playing the first song
/usr/bin/mpc play
sleep 0.5

# set music volume to target level
"${HOME}"/scripts/obs_scripts/obs_music_volume.sh target -10

sleep 0.5
notify-send --expire-time=1000 --icon=info "Streaming now!"