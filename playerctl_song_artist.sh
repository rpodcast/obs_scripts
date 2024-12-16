#!/usr/bin/env bash
# arg 1: Text string of current song playing title
# - produced with this command: playerctl --player=cantata metadata --format "{{ artist }}" --follow
# use this script in the following way:
# playerctl --player=cantata metadata --format "{{ artist }}" --follow | xargs  -I {} ~/scripts/obs_scripts/playerctl_song_artist.sh {}

output_path=/home/eric/tmparea
output_file=current_song_artist.txt
final_path="${output_path}/${output_file}"

string_source=$1
echo "$string_source" > "$final_path"
