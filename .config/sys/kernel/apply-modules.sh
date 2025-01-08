#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/kernel/common-modules.sh";

backup_modules_files=$(list_backup_modules);

if [ ! -z $backup_modules_files ]; then
  sudo cp --recursive $backup_modules_files "$MODULES_PATH/";
fi
