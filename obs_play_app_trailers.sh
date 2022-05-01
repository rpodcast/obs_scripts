#!/usr/bin/env bash

trailer_duration=20
time_btw=0.5
# shinymons
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "granjon_shinymons", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "granjon_shinymons_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'


sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "granjon_shinymons", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "granjon_shinymons_text", "visible": false}'

# hexmake 
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "faye_hexmake", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "faye_hexmake_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'
sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "faye_hexmake", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "faye_hexmake_text", "visible": false}'

# hotshot random
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "nantz_hotshotsrandom", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "nantz_hotshotsrandom_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'
sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "nantz_hotshotsrandom", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "nantz_hotshotsrandom_text", "visible": false}'
sleep 1

# mypaintings
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "perrier_hexmemory", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "perrier_hexmemory_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'
sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "perrier_hexmemory", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "perrier_hexmemory_text", "visible": false}'
sleep 1

# movievuer
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "friss_movievue", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "friss_movievue_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'
sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "friss_movievue", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "friss_movievue_text", "visible": false}'
sleep 1

# fairsplit
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "ho_dynastyrankings", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "ho_dynastyrankings_text", "visible": true}'
sleep 1
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": true}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": true}'
sleep $trailer_duration
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon Trailers", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[*] Starting Soon Shiny", "item": "[B] SDS Starting Soon App Text", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon Trailers", "item": "ho_dynastyrankings", "visible": false}'
obs-cli-js SetSceneItemProperties='{"scene-name": "[B] SDS Starting Soon App Text", "item": "ho_dynastyrankings_text", "visible": false}'
sleep 1
