#!/usr/bin/env bash

set -e;

echo "NOTE: Try clearing uneeded packages first for a small package list";
echo "";
echo "Arch wiki guides:";
echo "- https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans)";
echo "- https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Detecting_more_unneeded_packages";

explicit_path=explicit-pkglist.txt;
foreign_path=foreign-pkglist.txt;

pacman -Qqm | grep --invert-match --fixed-strings 'yay' > $foreign_path;
pacman -Qqe |
  grep --invert-match --fixed-strings 'yay' |
  grep --invert-match --file $foreign_path > $explicit_path;
