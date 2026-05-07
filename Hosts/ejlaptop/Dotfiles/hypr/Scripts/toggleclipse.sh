#!/usr/bin/env bash

# If clipse kitty window exists → close it
if hyprctl clients | grep -q 'title: clipse'; then
    hyprctl dispatch closewindow title:clipse
else
    kitty --title clipse clipse
fi
