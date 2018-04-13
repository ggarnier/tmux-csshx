# tmux-csshx

[csshX](https://github.com/brockgr/csshx)-like utility for [tmux](https://github.com/tmux/tmux)

## Usage

```
./csshx.sh [<address 1> <address 2>...] [-l/--login <username>]
```

This will create a new tmux window, with one pane for each ssh session.

The optional username is only set for addresses that don't specify a username themselves (like `user@example.com`).
