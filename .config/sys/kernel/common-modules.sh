#!/usr/bin/env bash

set -e;

export MODULE_EXT='.sync.conf';
export MODULES_PATH='/etc/modules-load.d';

export BACKUP_PATH="$XDG_CONFIG_HOME/sys/kernel/modules-load";

function list_modules {
  find $MODULES_PATH -name "*$MODULE_EXT";
}

function list_backup_modules {
  find $BACKUP_PATH -name "*$MODULE_EXT";
}

function filter_module_name {
  echo "$1" | rg --fixed-strings "$MODULES_PATH/" --replace '- ';
}

function show_module_files {
  echo -e "kernel module files:";
  filter_module_name "$1";
}

export -f list_modules;
export -f list_backup_modules;
export -f filter_module_name;
export -f show_module_files;
