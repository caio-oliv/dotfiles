#!/usr/bin/env bash

set -e;

SSHD_KEY_PATH='/etc/ssh';

function list_host_keys {
  find $SSHD_KEY_PATH -name "ssh_host_*_key*";
}

function generate_keys {
  sudo ssh-keygen -t ed25519 -f "$SSHD_KEY_PATH/ssh_host_ed25519_key" -N "";
  sudo ssh-keygen -t rsa -b 4096 -f "$SSHD_KEY_PATH/ssh_host_rsa_key" -N "";
}

host_keys=$(list_host_keys);
sudo rm $host_keys;

generate_keys;
