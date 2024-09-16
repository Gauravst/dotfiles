#!/bin/bash

STATE_FILE="$HOME/.config/hypr/scripts/waybar-state"
THRESHOLD=5  # Number of pixels from the top to trigger Waybar

# Get the current mouse Y-coordinate
MOUSE_Y=$(hyprctl cursorpos | awk '{print $2}')

# Read the last known state of Waybar from the state file
LAST_STATE=$(cat "$STATE_FILE" 2>/dev/null)

# Check if Waybar is currently running
if pgrep -x "waybar" > /dev/null; then
    if (( MOUSE_Y > THRESHOLD )); then
        # If Waybar is running and the mouse is not near the top, kill Waybar
        killall waybar
        echo "off" > "$STATE_FILE"
    fi
else
    if (( MOUSE_Y <= THRESHOLD )); then
        # If Waybar is not running and the mouse is near the top, start Waybar
        waybar &
        echo "on" > "$STATE_FILE"
    fi
fi
