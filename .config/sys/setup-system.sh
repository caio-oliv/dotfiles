#!/usr/bin/env bash

set -e;

PACKAGE_SCRIPT_PATH="$XDG_CONFIG_HOME/sys/package";
KENREL_SCRIPT_PATH="$XDG_CONFIG_HOME/sys/kernel";
USER_SCRIPT_PATH="$XDG_CONFIG_HOME/sys/user";
SERVICE_SCRIPT_PATH="$XDG_CONFIG_HOME/sys/service";
SSHD_SCRIPT_PATH="$XDG_CONFIG_HOME/sys/sshd";

function install_system_packages {
  exec "$PACKAGE_SCRIPT_PATH/install-yay.sh";
  exec "$PACKAGE_SCRIPT_PATH/install-pkglist.sh";
}

function install_kernel_modules {
  exec "$KENREL_SCRIPT_PATH/apply-modules.sh";
}

function setup_ssh_deamon {
  exec "$SSHD_SCRIPT_PATH/apply-sshd-config.sh";
}

function start_services {
  exec "$SERVICE_SCRIPT_PATH/start-system-service.sh";
  exec "$SERVICE_SCRIPT_PATH/start-user-service.sh";
}

function setup_user {
  exec "$USER_SCRIPT_PATH/setup-current-user.sh";
}

function reboot_system {
  systemctl reboot;
}

function should_install_packages {
  local result="true";

	for arg in "$@"; do
		if [[ $arg == "--no-install-package" ]]; then
			result="";
			break;
		fi
	done

	echo -n $result;
}

function should_reboot {
  local result="";

	for arg in "$@"; do
		if [[ $arg == "--reboot" ]]; then
			result="true";
			break;
		fi
	done

	echo -n $result;
}


arg_install_package=$(should_install_packages $@);
arg_reboot=$(should_reboot $@);

if [[ $arg_install_package == "true" ]]; then
  install_system_packages;
fi

install_kernel_modules;
setup_ssh_deamon;
start_services;
setup_user;

if [[ $arg_reboot == "true" ]]; then
  reboot_system;
fi
