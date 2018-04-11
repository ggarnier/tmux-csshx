#!/bin/sh

tmux new-window -n "ssh"
tmux split-window -v
tmux send-keys "echo ssh 1" C-m
tmux select-pane -t 1
tmux send-keys "echo ssh 2" C-m
tmux setw synchronize-panes
