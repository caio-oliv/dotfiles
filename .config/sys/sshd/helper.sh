#!/usr/bin/env bash

set -e;

export CONFIG_EXT='.sync.conf';
export SSHD_CONFIG_PATH='/etc/ssh/sshd_config.d';

export SSHD_CONFIG_BACKUP_PATH="$XDG_CONFIG_HOME/sys/sshd/config";

function list_sshd_configs {
  find $SSHD_CONFIG_PATH -name "*$CONFIG_EXT";
}

function list_sshd_backup_configs {
  find $SSHD_CONFIG_BACKUP_PATH -name "*$CONFIG_EXT";
}

export -f list_sshd_configs;
export -f list_sshd_backup_configs;
