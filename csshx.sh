#!/bin/sh

addresses="1.2.3.4 5.6.7.8 9.10.11.12"

tmux new-window -n "ssh"

i=0
for addr in `echo $addresses`; do
    if [ "$i" -gt 0 ]; then
        tmux split-window
        tmux select-layout tiled
    fi
    tmux send-keys "ssh $addr" C-m
    i=$((i+1))
done

tmux setw synchronize-panes
