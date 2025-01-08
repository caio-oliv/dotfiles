#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/sshd/helper.sh";

backup_files=$(list_sshd_backup_configs);

if [ ! -z $backup_files ]; then
  rm --recursive $backup_files;
fi

sync_config_files=$(list_sshd_configs);

if [ ! -z $sync_config_files ]; then
  cp --recursive $sync_config_files "$SSHD_CONFIG_BACKUP_PATH/";
fi
