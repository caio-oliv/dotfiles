function todofind() {
  local invalid_around="[^_\"'a-zA-Z]";
  local regex="$invalid_around(TODO|NOTE|TEST|FIX|FIXME|PERF|SAFETY)($invalid_around:?)";

  rg $regex $@;
}

function random-string() {
  local str=$(cat /dev/urandom | base64 | head -c $1);
  echo "$str";
}

function git-conflict-accept-both() {
  local regex="^(=======)|(<<<<<<<*)|(>>>>>>>*)";

  rg --invert-match $regex $@;
}

function git-semantic-msg() {
  echo -n "- feat: adds or remove features
- fix: fixes a bug
- refactor: rewrite/restructure code
- perf: special refactor commits that improve performance
- style: do not affect any meaning (white-space, formatting, semi-colons, etc)
- test: add missing tests, corrects or remove existing tests
- docs: affect only documentation
- build: affect build componentes (build tools, ci pipeline, dependencies, project version, etc)
- ops: operational componentes (infrastructure, deployment, backup, recovery)
- chore: miscellaneos
";
}

function reload-bluetooth() {
  sudo modprobe --remove btusb;
  sudo modprobe btusb;
}
