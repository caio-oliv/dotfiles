#!/usr/bin/env bash

set -e;

# TODO: setup system.
# - install yay
# - install system packages
# - apply kernel modules
# - setup user groups
# - change default shell
# - reboot
# - enable system services
# - enable user services


# get groups: groups $USER

# seat
sudo usermod --append --groups seat,wheel,kvm,libvirt,qemu $USER;

# TODO: reboot

sudo systemctl enable --now seatd;
sudo systemctl enable --now sshd;
