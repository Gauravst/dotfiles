#!/bin/bash

STATE_FILE="$HOME/.config/hypr/scripts/waybar-state"

if pgrep -x "waybar" > /dev/null; then
    killall waybar
    echo "off" > "$STATE_FILE"
else
    waybar &
    echo "on" > "$STATE_FILE"
fi

