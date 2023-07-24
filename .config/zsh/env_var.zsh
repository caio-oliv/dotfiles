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

# rust
export RUST_BACKTRACE=1
export PATH="$PATH:$HOME/.cargo/bin"
export CROSS_CONTAINER_ENGINE=podman

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
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

# python? (not shure why python)
export PATH="$PATH:$HOME/.local/bin"
