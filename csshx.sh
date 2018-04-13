#!/bin/sh

addresses="$@"

num_addresses=`echo "$addresses" | wc -w`
if [ "$num_addresses" -eq 0 ]; then
    echo "Need at least one hostname"
    exit 2
fi

ssh_command () {
    login="user"
    addr="$1"
    if [[ ! "$addr" =~ "@" ]]; then
        addr=`echo $login@$addr`
    fi
    echo "echo ssh $addr"
}

tmux new-window -n "ssh"

i=0
for addr in `echo "$addresses"`; do
    if [ "$i" -gt 0 ]; then
        tmux split-window
        tmux select-layout tiled
    fi
    cmd=`ssh_command "$addr"`
    tmux send-keys "$cmd" C-m
    i=$((i+1))
done

tmux setw synchronize-panes
