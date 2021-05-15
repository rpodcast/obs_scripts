#!/usr/bin/env bash

obs-cli SetCurrentScene='{"scene-name": "[*] Closing Scene General"}'
sleep 8

# obtain status of streaming
streaming_status=$(obs-cli GetStreamingStatus | jq '.[0]' | jq '.streaming')
echo $streaming_status

if [ $streaming_status == true ]
then
    obs-cli StopStreaming
    sleep 4
fi

recording_status=$(obs-cli GetRecordingStatus | jq '.[0]' | jq '.isRecording')

if [ $recording_status == true ]
then
    obs-cli StopRecording
    sleep 2
fi
