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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbos currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

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

