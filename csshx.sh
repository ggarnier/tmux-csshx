#!/bin/sh

addresses="1.2.3.4 5.6.7.8 9.10.11.12"

tmux new-window -n "ssh"

i=0
splitdirection="v"
for addr in `echo $addresses`; do
    if [ "$i" -gt 0 ]; then
        tmux split-window -"$splitdirection"
        if [ "$splitdirection" == "v" ]; then
            splitdirection="h"
        else
            splitdirection="v"
        fi
    else
        tmux select-pane -t "$i"
    fi
    tmux send-keys "echo ssh $addr" C-m
    i=$((i+1))
done

tmux setw synchronize-panes
