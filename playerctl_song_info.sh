#!/usr/bin/env bash
# arg 1: file path to album art 
# - produced with this command: playerctl --player=cantata metadata --format "\"{{ mpris:artUrl }}\"" --follow
# use this script in the following way:
# playerctl --player=cantata metadata --format "\"{{ mpris:artUrl }}\"" --follow | xargs  -I {} ~/scripts/obs_scripts/playerctl_album_art.sh {}

art_source=$1
art_clean1=$(echo "$art_source" | sed -E 's/^"//' | sed -E 's/"$//' )
#echo "$art_clean1"

art_clean2=$(echo "$art_clean1" | sed -E 's/^\s*.*:\/\///g' )
#echo "$art_clean2"
art_file=$(basename -- "$art_clean2")
art_extension="${art_file##*.}"

output_path=/home/eric/tmparea
final_path="${output_path}/cover.${art_extension}"
#echo "$final_path"
cp -- "${art_clean2}" "${final_path}"
