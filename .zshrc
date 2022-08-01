# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	docker
	docker-compose
)

source $ZSH/oh-my-zsh.sh

########## My Configs ##########
[[ -f "$HOME/.asdf/asdf.sh" ]] && . $HOME/.asdf/asdf.sh

# SSH Agent Service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# GPG key
export GPG_TTY=$(tty)

# Aliases
alias grep='grep --color'
alias ip='ip -c -h'
alias exa='exa -l -a -b'
alias ls='exa -l -a -b'
alias pmr='pnpm run'
alias zll='zellij'

# Docker rootless
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# My init script
[[ -f "$HOME/.caio_init.sh" ]] && . $HOME/.caio_init.sh

# Google Cloud SDK.
[[ -f '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc'
[[ -f '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc'

# starship setup
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# zellij attach on last session
# export ZELLIJ_LAST_SESSION=$(zellij list-sessions | tail -1)
# [[ -n "${ZELLIJ_LAST_SESSION}" ]] && zellij attach $ZELLIJ_LAST_SESSION
