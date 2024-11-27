function todofind() {
  local invalid_around="[^_\"'a-zA-Z]";
  local regex="$invalid_around(TODO|NOTE|TEST|FIX|FIXME|PERF|SAFETY)($invalid_around:?)";

  rg $regex $@;
}
