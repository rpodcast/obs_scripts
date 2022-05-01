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

cat << 'EOF' > /etc/udev/rules.d/99-streamdeck.rules
SUBSYSTEM=="input", GROUP="input", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", ATTRS{idProduct}=="0060", MODE:="666", GROUP="plugdev"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", ATTRS{idProduct}=="0063", MODE:="666", GROUP="plugdev"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", ATTRS{idProduct}=="006c", MODE:="666", GROUP="plugdev"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", ATTRS{idProduct}=="006d", MODE:="666", GROUP="plugdev"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", ATTRS{idProduct}=="0080", MODE:="666", GROUP="plugdev"
EOF
sudo udevadm control --reload-rules

# The driver: https://github.com/unix-streamdeck/streamdeckd
apt -y install golang-go libusb-1.0-0-dev xdotool
cd /tmp/go/src
git clone --recursive https://github.com/unix-streamdeck/streamdeckd.git
cd streamdeckd
go build
go install github.com/unix-streamdeck/streamdeckd

The UI: https://github.com/unix-streamdeck/streamdeckui
apt -y install libglfw3 libxxf86vm-dev libgl1-mesa-dev xorg-dev zenity
cd /tmp/go/src
git clone --recursive https://github.com/unix-streamdeck/streamdeckui --branch v1.0.1
cd streamdeckui
go build
go install

find "${GOPATH}/bin/" -type f -executable | while read -r EXECUTABLE; do
    install -DT "${EXECUTABLE}" "/usr/local/bin/$(basename "${EXECUTABLE}")"
done

# Remove the now obsolete old systemd unit
if [ -e /usr/lib/systemd/user/streamdeckd.service ]; then
  systemctl --user disable streamdeckd
  rm -f /usr/lib/systemd/user/streamdeckd.service
fi

mkdir -p /usr/local/share/icons/hicolor/256x256/apps/ 2>/dev/null
wget -q "https://cdn.jsdelivr.net/gh/pauby/ChocoPackages@f08050f3/icons/streamdeck.png" -O /usr/local/share/icons/hicolor/256x256/apps/streamdeckui.png
mkdir -p /usr/local/share/applications 2>/dev/null
cat << 'EOF' > /usr/local/share/applications/streamdeckui.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=StreamDeck Editor
Comment=StreamDeck Unix Editor
Exec=/usr/local/bin/streamdeckui
Icon=/usr/local/share/icons/hicolor/256x256/apps/streamdeckui.png
Terminal=false
Categories=Utility;
EOF

cat << 'EOF' > /etc/xdg/autostart/streamdeckd.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=streamdeckd
Comment=StreamDeck Unix Daemon
Exec=/usr/local/bin/streamdeckd
Terminal=false
NoDisplay=true
EOF

update-desktop-database /usr/local/share/applications/

rm -rf "${GOPATH}"

echo
echo "streamdeckd will autostart when logging in via /etc/xdg/autostart/streamdeckd.desktop"
echo "To start streamdeckd:"
echo "  /usr/local/bin/streamdeckd &"
echo
echo "To restart streamdeckd:"
echo "  pkill streamdeckd && /usr/local/bin/streamdeckd &"
echo
echo "NOTE! If you just installed streamdeckd for the first time, unplug and plugin your StreamDeck now."