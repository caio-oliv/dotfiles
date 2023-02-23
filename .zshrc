# load autocompletions
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit -i

source '.config/zsh/history_opt.zsh';
source '.config/zsh/bindings.zsh';
source '.config/zsh/alias.zsh';

# start sway after shell login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

# rust
export RUST_BACKTRACE=1
export PATH="$PATH:$HOME/.cargo/bin"
export CROSS_CONTAINER_ENGINE=podman

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

source '.config/zsh/plugins.zsh';
