#!/usr/bin/env bash

SESSION_NAME="main"
WINDOW_NAME="Search-Project"
SCRIPT_PATH="~/.config/scripts/pr.sh"

if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  CURRENT_SESSION=$(tmux display-message -p '#S')

  if [ "$CURRENT_SESSION" != "$SESSION_NAME" ]; then
    tmux switch-client -t $SESSION_NAME
  fi
  tmux new-window -t $SESSION_NAME -n $WINDOW_NAME "bash $SCRIPT_PATH"

else
  tmux new-session -d -s $SESSION_NAME -n $WINDOW_NAME "bash $SCRIPT_PATH"
  tmux switch-client -t $SESSION_NAME
  tmux detach -t $CURRENT_SESSION
fi
