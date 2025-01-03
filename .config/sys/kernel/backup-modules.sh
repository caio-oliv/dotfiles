#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/kernel/common-modules.sh";

backup_files=$(list_backup_modules);
rm --recursive $backup_files;

modules_file_path=$(list_modules);
cp --recursive $modules_file_path "$BACKUP_PATH/";
