#!/usr/bin/env bash

set -e;

explicit_path=explicit-pkglist.txt;
foreign_path=foreign-pkglist.txt;

pacman -Qqm | grep --invert-match --fixed-strings 'yay' > $foreign_path;
pacman -Qqe |
  grep --invert-match --fixed-strings 'yay' |
  grep --invert-match --file $foreign_path > $explicit_path;
