#!/usr/bin/env bash

set -e;

CONFIG_EXT='.sync.conf';
SSHD_CONFIG_PATH='/etc/ssh/sshd_config.d';

SSHD_CONFIG_BACKUP_PATH="$XDG_CONFIG_HOME/sys/sshd/config";

function list_sshd_configs {
  find $SSHD_CONFIG_PATH -name "*$CONFIG_EXT";
}

function list_sshd_backup_configs {
  find $SSHD_CONFIG_BACKUP_PATH -name "*$CONFIG_EXT";
}

backup_config_files=$(list_sshd_backup_configs);
sudo cp --recursive $backup_config_files "$SSHD_CONFIG_PATH/";
