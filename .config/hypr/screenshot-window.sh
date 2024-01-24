#!/usr/bin/env bash

set -e;

position=$(hyprctl activewindow | rg '.*at: ' --replace '');
size=$(hyprctl activewindow | rg '.*size: ' --replace '' | rg ',' --replace 'x');
geometry="$position $size";

grim -t png -l 0 -g "$geometry" - | wl-copy;
wl-paste >> $(xdg-user-dir PICTURES)/screenshots/$(date +'%Y-%m-%d:%H-%M-%S.png');
notify-send --urgency normal --expire-time 3000 --app-name 'Screenshot' 'Screenshot saved';
