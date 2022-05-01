#!/usr/bin/env bash
# stop current song if playing
/usr/bin/mpc stop
sleep 1

# clear song queue
/usr/bin/mpc clear
sleep 1

# load playlist
/usr/bin/mpc load livestream_starting_soon
sleep 1

# shuffle song order
/usr/bin/mpc shuffle
sleep 1

# start playing the first song
/usr/bin/mpc play
sleep 0.5

sleep 1
notify-send --expire-time=1000 --icon=info "Playing shinydevseries music for trailers"