#!/usr/bin/env bash

# change scene to game if needed
#obs-cli SetCurrentScene='{"scene-name": "[*] Gaming Scene"}'

#sleep 1

# Launch game
#/home/eric/.steam/debian-installation/ubuntu12_32/reaper SteamLaunch AppId=609920 -- '/home/eric/.steam/debian-installation/steamapps/common/SteamLinuxRuntime_soldier'/_v2-entry-point --verb=waitforexitandrun -- '/home/eric/.steam/debian-installation/steamapps/common/Proton 5.13'/proton waitforexitandrun  '/home/eric/.steam/debian-installation/steamapps/common/Hotshot Racing/HotshotRacing.exe'

#WINEPREFIX=/path/to/steamapps/compatdata/<game ID>/pfx /path/to/steamapps/common/<Some Proton Version>/dist/bin/wine game.exe

#sleep 6

# change audio sink
"${HOME}"/scripts/obs_scripts/sink-move.sh "HotshotRacing.exe" "Game"