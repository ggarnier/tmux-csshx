#!/bin/sh

addresses="1.2.3.4 5.6.7.8 9.10.11.12"

tmux new-window -n "ssh"

i=0
splitdirection="v"
for addr in `echo $addresses`; do
    if [ "$i" -gt 0 ]; then
        tmux split-window -"$splitdirection" 2>/dev/null
        if [ "$?" -ne 0 ]; then
            tmux select-layout tiled
            tmux split-window -"$splitdirection"
        fi
        if [ "$splitdirection" == "v" ]; then
            splitdirection="h"
        else
            splitdirection="v"
        fi
    fi
    tmux send-keys "ssh $addr" C-m
    i=$((i+1))
done

tmux select-layout tiled
tmux setw synchronize-panes
