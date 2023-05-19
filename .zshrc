# load autocompletions
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit -i

# enable menu-drive completion
zstyle ':completion:*' menu select

# select word style from bash
# e.g. use word delimiter as "*?_-.[]~=/&;!#$%^(){}<>"
# use `echo $WORDCHARS` to verify
autoload -U select-word-style
select-word-style bash

# XDG env
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


source "$XDG_CONFIG_HOME/zsh/history_opt.zsh";
source "$XDG_CONFIG_HOME/zsh/bindings.zsh";
source "$XDG_CONFIG_HOME/zsh/alias.zsh";
fpath+="$XDG_CONFIG_HOME/zsh/functions";

# start sway after shell login
if [ -z $WAYLAND_DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	export XDG_CURRENT_DESKTOP=sway;
  exec sway;
fi

# rust
export RUST_BACKTRACE=1
export PATH="$PATH:$HOME/.cargo/bin"
export CROSS_CONTAINER_ENGINE=podman

# helix
export HELIX_PATH="$XDG_CONFIG_HOME/helix"

# asdf
if [ -f "$HOME/.asdf/asdf.sh" ]; then
	ASDF_DIR="$HOME/.asdf";
	. "$ASDF_DIR/asdf.sh";
fi

# SSH and GPG
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)

# general
export PS_FORMAT=pid,uname,pcpu,pmem,command,start,tty
export EDITOR=helix
export LESSHISTFILE=-

# autojump
[[ -f '/usr/share/autojump/autojump.sh' ]] && . '/usr/share/autojump/autojump.sh'

# Google Cloud SDK.
[[ -f '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc'
[[ -f '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc'

# AWS CLI completition
complete -C aws_completer aws

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

# python
export PATH="$PATH:$HOME/.local/bin"


# starship setup
eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/zsh/plugins.zsh";

