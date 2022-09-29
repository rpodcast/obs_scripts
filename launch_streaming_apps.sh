#!/usr/bin/env bash
# arg 1: size type
# - "narrow": Size for when chat is open on right sidebar (typically live streaming)
# - "wide" Size for screencasts where the window takes the full monitor resultion for the virtual display

# Define constants
primary_monitor="DP-2"
secondary_monitor="DVI-D-0"
phantom_monitor="HDMI-0"

HOST=$(hostname -s)
size_type="${1}"

function start_app() {
    "${@}" >/dev/null 2>&1 &
    sleep 1
}

function start_appimage() {
    app_name=$1
    exec "$(ls "${HOME}/Applications/$app_name"*.AppImage | tail -n1)" "$@" >/dev/null 2>&1 &
    sleep 1
}

# remove "@aitumapp" due to odd issues with appimage launcher
# start that manually myself
for APP in obs code Discord firefox cantata gitkraken standard-notes msedge; do
    if ! pidof -q "${APP}"; then
        echo "Starting: ${APP}"
        case "${APP}" in
            obs) start_app obs
                 sleep 5;;
            Discord) start_app discord;;
            firefox) start_app firefox;;
            "@aitumapp") start_appimage Aitum
                 sleep 5;;
            gitkraken) "${HOME}"/scripts/obs_scripts/gitkraken.sh;;
            standard-notes) start_app standard-notes;;
            msedge) start_app microsoft-edge;;
            *) start_app "${APP}";;
            
        esac
    else
        echo "Detected: ${APP}"
    fi
done

sleep 5

# move app windows to appropriate locations
# apps for virtual display (HDMI-0): Visual Studio Code, Firefox, GitKraken
case $size_type in

    "narrow")
        virt_x_size="1520"
        virt_y_size="1080"
        ;;
    "wide")
        virt_x_size="1918"
        virt_y_size="1080"
        ;;
esac

# move apps to appropriate windows
# - 4k monitor: "DP-2"
# - left HP monitor" "DVI-D-0"
# - virtual display: "HDMI-0"

# apps for streaming itself
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "OBS" "DP-2" 0 max max
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Aitum" "DVI-D-0" 1100 600 1000

# apps for other purposes
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Standard Notes" "DVI-D-0" 0 1918 1078
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Cantata" "DVI-D-0" 0 800 700
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Microsoft" "DVI-D-0" 0 1100 1080

# apps for virtual display
#"${HOME}"/scripts/obs_scripts/obs_place_window.sh "GitKraken" "HDMI-0" 0 "${virt_x_size}" "${virt_y_size}"
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Visual Studio Code" "HDMI-0" 0 "${virt_x_size}" "${virt_y_size}"
"${HOME}"/scripts/obs_scripts/obs_place_window.sh "Firefox" "HDMI-0" 0 "${virt_x_size}" "${virt_y_size}"