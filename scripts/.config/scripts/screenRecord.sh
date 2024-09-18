#!/bin/bash

stateFile="$HOME/temp/screenRecordState"
state=$(cat "$stateFile")

recordVideo() {
  echo "Starting recording..."
  recordVideoFileName="screenRecord-$(date +"%d-%m-%Y_%H-%M-%S").mp4"
  recordVideoFilePath="$HOME/Desktop/gst/sr/$recordVideoFileName"

  # Remove the file if it already exists
  if [ -f "$recordVideoFilePath" ]; then
    rm "$recordVideoFilePath"
  fi

  # Start recording and save the PID
  wf-recorder -f "$recordVideoFilePath" --codec libx264 --bitrate 4000k &
  wf_recorder_pid=$!

  echo "Recording started with PID $wf_recorder_pid"
  echo "on" >"$stateFile"
}

# Check the current state and act accordingly
if [ "$state" = "on" ]; then
  killall -9 wf-recorder
  echo "off" >"$stateFile"
  echo "Recording stopped."
else
  recordVideo
fi
