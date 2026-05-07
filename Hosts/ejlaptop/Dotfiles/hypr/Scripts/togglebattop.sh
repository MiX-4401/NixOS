#!/usr/bin/env bash

# If battop kitty window exists → close it
if hyprctl clients | grep -q 'title: battop'; then
    hyprctl dispatch closewindow title:battop
else
    kitty --title battop battop
fi
