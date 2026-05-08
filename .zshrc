source "$HOME/.config/zsh/env_var.zsh";
source "$XDG_CONFIG_HOME/zsh/history_opt.zsh";
source "$XDG_CONFIG_HOME/zsh/bindings.zsh";
source "$XDG_CONFIG_HOME/zsh/alias.zsh";
source "$XDG_CONFIG_HOME/zsh/functions.zsh";

# load autocompletions
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit -i -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# enable menu-drive completion
zstyle ':completion:*' menu select cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# select word style from bash
# e.g. use word delimiter as "*?_-.[]~=/&;!#$%^(){}<>"
# use `echo $WORDCHARS` to verify
autoload -U select-word-style
select-word-style bash


# start sway after shell login
if [ -z $WAYLAND_DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec start-hyprland > $HYPRLAND_START_LOG;
fi

# starship setup
eval "$(starship init zsh)"

# setup zsh plugins
source "$XDG_CONFIG_HOME/zsh/plugins.zsh";
