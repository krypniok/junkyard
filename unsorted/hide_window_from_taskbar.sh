#!/bin/bash

# Function to find the window ID based on the title string
get_window_id() {
    local title=$1
    xdotool search --name "$title"
}

# Function to hide the window from the taskbar
hide_window_from_taskbar() {
    local window_id=$1
    xprop -id "$window_id" -format _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_SKIP_TASKBAR
}

# Usage: ./hide_window_from_taskbar.sh "Window Title"
title="$1"

# Find the window ID based on the title
window_id=$(get_window_id "$title")

if [[ -n "$window_id" ]]; then
    # Hide the window from the taskbar
    hide_window_from_taskbar "$window_id"
    echo "Window with title '$title' is now hidden from the taskbar."
else
    echo "Window with title '$title' not found."
fi
