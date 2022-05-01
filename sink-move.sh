#!/usr/bin/env bash
# AUDIO_PLAYER example values
# mpd: "Music Player Daemon" to "Music"
# discord: "Chromium"  to "Discord"
# hot shot racing: "HotshotRacing.exe" to "Game"
# headphones "alsa_output.usb-Corsair_CORSAIR_VOID_ELITE_Wireless_Gaming_Dongle-00.analog-stereo"
AUDIO_PLAYER="${1}"
MOVE_TO="${2}"

if [ -z "$(which pactl)" ]; then
  echo "ERROR! pactl not found, please 'apt install pulseaudio-utils'."
  exit 1
fi

if [ -z "$(which pulsemixer)" ]; then
  echo "ERROR! pulsemixer not found, please 'apt install pulsemixer'."
  exit 1
fi

# obtain the actual number of the current sink associated with the supplied AUDIO_PLAYER
# Raw text for the sink
# Sink input:      ID: sink-input-3226, Name: Music Player Daemon, Mute: 0, Channels: 2, Volumes: ['83%', '83%']
SINK_INDEX=$(pulsemixer --list-sinks | grep "Name: ${AUDIO_PLAYER}" | cut -d' ' -f4 | sed 's/,//g' | cut -d'-' -f3)
if [ -z "${SINK_INDEX}" ]; then
    echo "ERROR! ${AUDIO_PLAYER} audio not found."
else
    if [[ "${MOVE_TO}" = "default" ]]; then
      # Get default audio device
      MOVE_TO=$(pactl list short sinks | grep -v null-sink | head -n 1 | cut -f2 | sed 's/ //g')
    fi

    if pactl move-sink-input "${SINK_INDEX}" "${MOVE_TO}"; then
      echo "Routed ${AUDIO_PLAYER} to ${MOVE_TO}."
    else
      echo "ERROR! Failed to route ${AUDIO_PLAYER} to ${MOVE_TO}."
    fi
fi