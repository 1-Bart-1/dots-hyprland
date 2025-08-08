#!/usr/bin/env fish

# Get current workspace ID (as integer)
set cur_ws (hyprctl activeworkspace -j | jq -r '.id')

# Calculate hidden workspace ID (current + 10)
set hidden_ws (math $cur_ws + 10)

# Get focused window address
set win_addr (hyprctl activewindow -j | jq -r '.address')

# Move the focused window to the hidden workspace
hyprctl dispatch movetoworkspacesilent $hidden_ws,address:$win_addr
