#!/bin/bash

# Start a new detached tmux session named 
tmux new-session -d -s dash -x- -y-

# split windows
tmux split-window -h -t dash:0.0
tmux split-window -h -t dash:0.0
tmux split-window -v -t dash:0.0
tmux split-window -v -t dash:0.2
tmux split-window -v -t dash:0.4

# asign window names
#tmux rename-pane -t dash:0.0 "OPENVPN"
# tmux rename-pane -t dash:0.1 "LISTENING POST"
# tmux rename-pane -t dash:0.2 "PYTHON WEB SERVER"
tmux select-pane -t dash:0.0 -T "OPENVPN"
tmux select-pane -t dash:0.2 -T "Memory / CPU"
tmux select-pane -t dash:0.1 -T "LISTENING POST"
tmux select-pane -t dash:0.4 -T "PYTHON WEB SERVER"

# resize panes
tmux select-pane -t 1
tmux resize-pane -y 50 

tmux select-pane -t 3
tmux resize-pane -y 50 

tmux select-pane -t 5
tmux resize-pane -y 50

tmux select-pane -t 3
tmux resize-pane -R 50

# send commands
tmux send-keys -t dash:0.0 'sudo openvpn ~/offsec/services/universal.ovpn' C-m
tmux send-keys -t dash:0.1 'nc -nvlp 4444' C-m
tmux send-keys -t dash:0.4 'python -m http.server -d /home/kali/offsec/services/http.server.files 8000' C-m
tmux send-keys -t dash:0.2 'top' C-m

# connect
tmux attach-session -t dash
