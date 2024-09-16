#!/bin/bash

STATE_FILE="$HOME/temp/waybarState"

if pgrep -x "waybar" > /dev/null; then
    killall waybar
    echo "off" > "$STATE_FILE"
else
    waybar &
    echo "on" > "$STATE_FILE"
fi

