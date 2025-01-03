#!/usr/bin/env bash

set -e;

source "$XDG_CONFIG_HOME/sys/kernel/common-modules.sh";

backup_modules_file_path=$(list_backup_modules);
sudo cp --recursive $backup_modules_file_path "$MODULES_PATH/";
