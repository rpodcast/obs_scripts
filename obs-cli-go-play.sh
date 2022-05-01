#!/usr/bin/env bash

# obtain status of streaming
streaming_status=$(obs-cli stream status | cut -d':' -f2)
echo $streaming_status

if [ $streaming_status == "false" ]
then
    notify-send --expire-time=1000 --icon=info "Already streaming!"
    exit 1
fi