#!/usr/bin/env bash

set -e;

function add_groups() {
  sudo usermod --append --groups seat,wheel,kvm,libvirt,qemu $1;
}

add_groups $USER;

# change default shell to zsh
chsh -s $(which zsh);
