#!/usr/bin/env bash

# arg 1: Stream platform: "YouTube" or "Twitch"
# arg 2: Stream type: "shiny" or "rpodcast"

# import stream key from file
source /home/eric/scripts/stream_keys.env

set_stream_service=$1
stream_type=$2
echo "Command-line argument 1: $set_stream_service"
echo "Command-line argument 2: $stream_type"

#echo $YOUTUBE_STREAM_KEY
#echo $TWITCH_STREAM_KEY

# obtain status of streaming
streaming_status=$(obs-cli GetStreamingStatus | jq '.[0]' | jq '.streaming')
echo $streaming_status

if [ $streaming_status == true ]
then
    notify-send --expire-time=1000 --icon=info "Already streaming!"
    exit 1
fi

# set the scene to collage
obs-cli SetCurrentScene='{"scene-name": "[*] Collage"}'

# obtain status of recording
recording_status=$(obs-cli GetRecordingStatus | jq '.[0]' | jq '.isRecording')
#echo $recording_status

# obtain current stream settings
current_stream_settings=$(obs-cli GetStreamSettings | jq '.[0]' | jq '.settings')
#echo $current_stream_settings

current_stream_service=$(echo "$current_stream_settings" | jq '.service')
#echo $current_stream_service

if [ $set_stream_service == "YouTube" ]
then
    if [ "$current_stream_service" == '"Twitch"' ]
    then
        notify-send --expire-time=1000 --icon=info "Setting YouTube"
        obs-cli SetStreamSettings='{"type": "rtmp_common", "settings": {"key": "'"$YOUTUBE_STREAM_KEY"'", "server": "rtmps://a.rtmps.youtube.com:443/live2", "service": "YouTube / YouTube Gaming" } }'
    else
        echo "Already on YouTube, no settings need to be updated"
    fi
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me Welcome Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Closing Scene Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
fi

if [ $set_stream_service == "Twitch" ]
then
    if [ "$current_stream_service" == '"YouTube / YouTube Gaming"' ]
    then
        notify-send --expire-time=1000 --icon=info "Setting Twitch"
        obs-cli SetStreamSettings='{"type": "rtmp_common", "settings": {"key": "'"$TWITCH_STREAM_KEY"'", "server": "auto", "service": "Twitch" } }'
    else
        echo "Already on Twitch, no settings need to be updated"
    fi

    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me Welcome Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
    obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Closing Scene Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
fi

notify-send --expire-time=1000 --icon=info "Finished stream setting"

sleep 1

# start streaming
obs-cli StartStreaming

sleep 7

# start recording
obs-cli StartRecording

sleep 5
if [ $stream_type == "shiny" ]
then
    obs-cli SetCurrentScene='{"scene-name": "[*] Intro Scene Shiny"}'
elif [ $stream_type == "rpodcast" ]
then
    obs-cli SetCurrentScene='{"scene-name": "[*] Intro Scene RPodcast"}'
fi

#if [ $service == '"Twitch"' ]
#then
#    obs-cli SetStreamSettings='{"type": "rtmp_common", "settings": {"key": "'"$YOUTUBE_STREAM_KEY"'", "server": "rtmps://a.rtmps.youtube.com:443/live2", "service": "YouTube / YouTube Gaming" } }'
#fi


# make YouTube subscribe alerts non-visible
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me Welcome Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Closing Scene Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": false}'

# make YouTube subscribe alerts visible
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me Welcome Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Only Me with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration with Chat Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Source Demonstration Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'
#obs-cli SetSceneItemProperties='{"scene-name": "[AUTO] Closing Scene Subscribe Alert", "item": "[LOCAL] Subscribe Widget Scene Source", "visible": true}'

# mute a source
#obs-cli ToggleMute='{"source": "[B] Rainwave Music Source"}'

# set volume of a source to specific level
#obs-cli SetVolume='{"source": "[B] Rainwave Music Source", "volume": -25, "useDecibel": true}'
