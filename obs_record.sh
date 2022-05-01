#!/usr/bin/env bash

# arg 1: Record Status: "start" or "stop"

record_status=$1
echo "Command-line argument 1: $record_status"

# obtain status of recording
recording_status=$(obs-cli GetRecordingStatus | jq '.[0]' | jq '.isRecording')
sleep 1

if [ $record_status == "start" ]
then
    obs-cli StartRecording
fi

if [ $record_status == "stop" ]
then
    obs-cli StopRecording
fi
