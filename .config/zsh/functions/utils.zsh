function todofind() {
  local invalid_around="[^_\"'a-zA-Z]";
  local regex="$invalid_around(TODO|NOTE|TEST|FIX|FIXME|PERF|SAFETY)($invalid_around:?)";

  rg $regex $@;
}

function git-conflict-accept-both() {
  local regex="^(=======)|(<<<<<<<*)|(>>>>>>>*)";

  rg --invert-match $regex $@;
}

function reload-bluetooth() {
  sudo modprobe --remove btusb;
  sudo modprobe btusb;
}
