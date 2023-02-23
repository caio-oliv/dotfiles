export ZSH="$HOME/.oh-my-zsh"

# zsh plugins
plugins=(
	git
)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source $ZSH/oh-my-zsh.sh

# zsh histtory config
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands


# key bindings
# docs: https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Bindable-Commands

# in case some of the binded keys are different, use `showkey -a` command to see the ascii
# code of the keystrokes
bindkey '^H' backward-kill-word  # <ctrl>+<backspace> = delete previous word
bindkey '^[[3;5~' kill-word      # <ctrl>+<del>       = delete next word


# Start sway after shell login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

# rust
export RUST_BACKTRACE=1
export PATH="$PATH:$HOME/.cargo/bin"
export CROSS_CONTAINER_ENGINE=podman

rust_cov() {
	python -m http.server -d /home/caio/.local/build/rust/llvm-cov/html
}

# asdf
[[ -f "/opt/asdf-vm/asdf.sh" ]] && . /opt/asdf-vm/asdf.sh
[[ -f "$HOME/.asdf/asdf.sh" ]] && . $HOME/.asdf/asdf.sh

# SSH and GPG
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)

# general
export PS_FORMAT=pid,uname,pcpu,pmem,command,start,tty
export EDITOR=helix

# Aliases
alias conf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias grep='grep --color'
alias ip='ip -c -h'
alias exa='exa -l -a -b'
alias ls='exa -l -a -b'
alias pmr='pnpm run'
alias pmx='pnpm exec'
alias podose='podman-compose'

alias zll='zellij'
alias hx='helix'

# autojump
[[ -f '/usr/share/autojump/autojump.sh' ]] && . '/usr/share/autojump/autojump.sh'

# Google Cloud SDK.
[[ -f '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc'
[[ -f '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc'

# AWS CLI completition
complete -C aws_completer aws

# starship setup
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$GLOBAL_PNPM_PATH:$PNPM_HOME"

# python
export PATH="$PATH:$HOME/.local/bin"

# zellij attach on last session
# export ZELLIJ_LAST_SESSION=$(zellij list-sessions | tail -1)
# [[ -n "${ZELLIJ_LAST_SESSION}" ]] && zellij attach $ZELLIJ_LAST_SESSION

# enable syntax highlighting
# package: zsh-syntax-highlighting
zsh_syntax_highlighting="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
[[ -f $zsh_syntax_highlighting ]] && source $zsh_syntax_highlighting

