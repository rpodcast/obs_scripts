#!/usr/bin/env bash

# arg 1: Scene name (in quotes)
# Examples
# "Host 1 Full Scene"
# "Host 1 & Guest 1 Video"
# "Host 1 & Guests 1-2 Video"
# "Guest 1 screenshare"
# "Guest 1 screenshare 3 videos"

MOVE_TO=${1}
echo $MOVE_TO
ttt=$(obs-cli scene current "${MOVE_TO}")