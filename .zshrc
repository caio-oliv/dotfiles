# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/caio/.oh-my-zsh"

# Set name of the theme to load https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

plugins=(
	git
	docker
	docker-compose
)

source $ZSH/oh-my-zsh.sh

########## My Configs ##########
. $HOME/.asdf/asdf.sh

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
$HOME/.caio_init.sh

# updates PATH for the Google Cloud SDK.
if [ -f '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc'; fi
# shell command completion for gcloud.
if [ -f '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

# starship setup
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/caio/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# zellij auto attach on woking session
export ZELLIJ_AUTO_ATTACH="true"
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij a -c working
    else
        zellij
    fi
fi

