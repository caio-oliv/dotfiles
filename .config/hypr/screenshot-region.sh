#!/usr/bin/env bash

set -e;

grim -t png -l 0 -g "$(slurp)" - | wl-copy;
wl-paste >> $(xdg-user-dir PICTURES)/screenshots/$(date +'%Y-%m-%d:%H-%M-%S.png');
notify-send --urgency normal --expire-time 3000 --app-name 'Screenshot' 'Screenshot saved';
