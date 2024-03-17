# zsh aliases

alias conf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias grep='grep --color=auto'
alias ip='ip -c -h'
alias ls='exa'
alias lsa='exa --long --all --group-directories-first'
alias exaa='exa --long --all'

alias netctl='nmcli'

alias podose='podman-compose'

alias pnpm='corepack pnpm'
alias pmr='corepack pnpm run'
alias pmx='corepack pnpm exec'

alias zll='zellij'
alias hx='helix'

alias todo-find='rg "NOTE|TODO|FIXME|PERF|TEST"'
alias clippy-annoying='cargo clippy --all -- -W clippy::all -W clippy::pedantic -W clippy::restriction -W clippy::nursery -D warnings 2> annoying.clippy'

