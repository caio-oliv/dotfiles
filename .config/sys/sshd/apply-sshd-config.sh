#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/sshd/helper.sh";

backup_config_files=$(list_sshd_backup_configs);

if [ ! -z $backup_config_files ]; then
  sudo cp --recursive $backup_config_files "$SSHD_CONFIG_PATH/";
fi
