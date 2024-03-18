#!/usr/bin/env bash

set -e;

yay_path='/tmp/install-yay';

mkdir -p $yay_path;

# Setup build dependencies
sudo pacman -S --needed git base-devel;
git clone 'https://aur.archlinux.org/yay.git' $yay_path;

# Build/Install package
makepkg --dir $yay_path --syncdeps --install;

# Remove yay-debug after yay is installed
sudo pacman -Rsu yay-debug;

# Clear
rm -rf $yay_path;
