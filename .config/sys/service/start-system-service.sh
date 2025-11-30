#!/usr/bin/env bash

set -e;

# seat daemon
sudo systemctl enable --now seatd;

# ssh daemon
# See: https://wiki.archlinux.org/title/OpenSSH#Daemon_management
sudo systemctl enable --now sshd;

# SMART status monitor
# See: https://wiki.archlinux.org/title/S.M.A.R.T.#daemon_management
sudo systemctl enable --now smartd;
