#!/usr/bin/env fish

set cur_ws (hyprctl activeworkspace -j | jq -r '.id')
set hidden_ws (math $cur_ws + 10)
set win_addr (hyprctl clients -j | jq -r ".[] | select(.workspace.id == $hidden_ws) | .address" | head -n 1)

if test -n "$win_addr"
    echo "Moving window $win_addr from hidden workspace $hidden_ws to current workspace $cur_ws"
    hyprctl dispatch movetoworkspacesilent $cur_ws,address:$win_addr
else
    echo "No window found on hidden workspace $hidden_ws"
end
