#!/usr/bin/env bash

set -e;

# SSH Agent
# See: https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user
systemctl --user enable --now ssh-agent;

# playerctl
# See: https://wiki.archlinux.org/title/MPRIS#Playerctl
systemctl --user enable --now playerctld;
