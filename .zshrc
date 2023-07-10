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

source "$HOME/.config/zsh/env_var.zsh";
source "$XDG_CONFIG_HOME/zsh/history_opt.zsh";
source "$XDG_CONFIG_HOME/zsh/bindings.zsh";
source "$XDG_CONFIG_HOME/zsh/alias.zsh";
fpath+="$XDG_CONFIG_HOME/zsh/functions";

# start sway after shell login
if [ -z $WAYLAND_DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	export XDG_CURRENT_DESKTOP=sway;
  exec sway;
fi

# asdf
if [ -f "$HOME/.asdf/asdf.sh" ]; then
	ASDF_DIR="$HOME/.asdf";
	. "$ASDF_DIR/asdf.sh";
fi

# autojump
[[ -f '/usr/share/autojump/autojump.sh' ]] && . '/usr/share/autojump/autojump.sh'

# Google Cloud SDK.
[[ -f '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/path.zsh.inc'
[[ -f '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc' ]] && . '/usr/bin/gcloud/google-cloud-sdk/completion.zsh.inc'

# AWS CLI completition
complete -C aws_completer aws

# starship setup
eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/zsh/plugins.zsh";

