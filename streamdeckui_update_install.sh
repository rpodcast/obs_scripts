#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR! Must be root."
    exit 1
fi

export GOPATH="/tmp/go"
if [ -d "${GOPATH}" ]; then
  rm -rf "${GOPATH}"
fi
mkdir -p "${GOPATH}/src"

#The UI: https://github.com/unix-streamdeck/streamdeckui
apt -y install libglfw3 libxxf86vm-dev libgl1-mesa-dev xorg-dev zenity
cd /tmp/go/src
git clone --recursive https://github.com/unix-streamdeck/streamdeckui
cd streamdeckui
go build
go install

find "${GOPATH}/bin/" -type f -executable | while read -r EXECUTABLE; do
    install -DT "${EXECUTABLE}" "/usr/local/bin/$(basename "${EXECUTABLE}")"
done

rm -rf "${GOPATH}"

