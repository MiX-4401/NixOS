#!/bin/bash

BRI=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$((BRI * 100 / MAX))

# Show OSD for 1.5s
notify-send -t 1500 -h int:value:$PERCENT -h string:x-canonical-private-synchronous:brightness "Brightness: $PERCENT%"
