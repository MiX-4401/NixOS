#!/bin/bash

OUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOL=$(echo "$OUT" | awk '{print int($2 * 100)}')

if echo "$OUT" | grep -q MUTED; then
  notify-send -t 1500 \
    -h string:x-canonical-private-synchronous:volume \
    "Volume muted"
else
  notify-send -t 1500 \
    -h int:value:$VOL \
    -h string:x-canonical-private-synchronous:volume \
    "Volume: $VOL%"
fi