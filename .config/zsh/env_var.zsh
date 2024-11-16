# User environment variables

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config";
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache";

export XDG_DESKTOP_DIR="$HOME/desktop";
export XDG_DOWNLOAD_DIR="$HOME/downloads";
export XDG_DOCUMENTS_DIR="$HOME/documents";
export XDG_MUSIC_DIR="$HOME/music";
export XDG_VIDEOS_DIR="$HOME/videos";
export XDG_PICTURES_DIR="$HOME/images";
export XDG_PUBLICSHARE_DIR="$HOME/public";

# binary/application
export BIN_HOME="$HOME/.local/bin"
export PATH="$PATH:$BIN_HOME"

# rust
export RUST_BACKTRACE=1
export PATH="$PATH:$HOME/.cargo/bin"
export CROSS_CONTAINER_ENGINE=podman

# dotnet
export DOTNET_CLI_USE_MSBUILD_SERVER=0

# helix
export HELIX_PATH="$XDG_CONFIG_HOME/helix"

# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# GPG
export GPG_TTY=$(tty)

# general
export PS_FORMAT=pid,uname,pcpu,pmem,command,start,tty
export EDITOR=helix
export LESSHISTFILE=-

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PATH:$PNPM_HOME"

# android
export ANDROID_HOME="/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export ANDROID_EMULATOR_HOME=$ANDROID_USER_HOME
export ANDROID_AVD_HOME="$ANDROID_EMULATOR_HOME/avd"
