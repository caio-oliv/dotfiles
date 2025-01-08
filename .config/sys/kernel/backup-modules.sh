#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/kernel/common-modules.sh";

backup_files=$(list_backup_modules);

if [ ! -z $backup_files ]; then
  rm --recursive $backup_files;
fi

modules_file_path=$(list_modules);

if [ ! -z $modules_file_path ]; then
  cp --recursive $modules_file_path "$BACKUP_PATH/";
fi
