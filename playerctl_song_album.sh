#!/usr/bin/env bash
# arg 1: Text string of current song playing title
# - produced with this command: playerctl --player=cantata metadata --format "{{ album }}" --follow
# use this script in the following way:
# playerctl --player=cantata metadata --format "{{ album }}" --follow | xargs  -I {} ~/scripts/obs_scripts/playerctl_song_album.sh {}

output_path=/home/eric/tmparea
output_file=current_song_album.txt
final_path="${output_path}/${output_file}"

string_source=$1
echo "$string_source" > "$final_path"
