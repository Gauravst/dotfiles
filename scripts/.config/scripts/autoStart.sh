#!/bin/bash
# autostart.sh

# Open Kitty in workspace 1 and start a tmux session named 'main'
hyprctl dispatch workspace 1
kitty --detach tmux new-session -A -s main

# Open Chrome in workspace 2
hyprctl dispatch workspace 2
google-chrome-stable --new-window &

# Wait for a moment to ensure Chrome starts properly
sleep 4

# Return to workspace 1
hyprctl dispatch workspace 1
