#!/usr/bin/env bash

set -e;

sudo pacman -S --needed - < explicit-pkglist.txt;

yay -S --needed - < foreign-pkglist.txt;
