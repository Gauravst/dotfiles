#!/bin/bash

# Preview image using ueberzug
if [[ -n $FIFO_UEBERZUG ]]; then
  echo "{\"action\": \"remove\", \"identifier\": \"preview\"}" >"$FIFO_UEBERZUG"
fi

if [[ "$1" =~ \.(jpe?g|png|gif|bmp|svg|webp)$ ]]; then
  ueberzug layer --parser bash --silent < <(
    echo "{\"action\": \"add\", \"identifier\": \"preview\", \"path\": \"$1\", \"x\": 0, \"y\": 0, \"width\": 40, \"height\": 20}"
  ) &
fi
