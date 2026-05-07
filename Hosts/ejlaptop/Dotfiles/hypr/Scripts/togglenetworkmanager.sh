#!/usr/bin/env bash

# If clipse kitty window exists → close it
if hyprctl clients | grep -q 'class:nm-connection-editor'; then
    hyprctl dispatch closewindow class:nm-connection-editor
else
    nm-connection-editor
fi