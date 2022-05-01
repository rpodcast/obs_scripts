#!/usr/bin/env bash

# arg 1: Stream type: "livestream_starting_soon", "final_fantasy_remix", "heavy_metal", "megaman", "techno", "sonic_ocremix"

music_playlist=$1

# stop current song if playing
/usr/bin/mpc pause
sleep 1

# clear song queue
/usr/bin/mpc clear
sleep 1

# load playlist
/usr/bin/mpc load $music_playlist
sleep 1

# shuffle song order
/usr/bin/mpc shuffle
sleep 1

# start playing the first song
/usr/bin/mpc play