#package:zsh-history-substring-search
#repo:https://github.com/zsh-users/zsh-history-substring-search
zsh_history_substring_search_path='/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh';
[[ -f $zsh_history_substring_search_path ]] && source $zsh_history_substring_search_path;

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE='1' # only unique search results are presented

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey $zsh_key_up   up-line-or-beginning-search;
bindkey $zsh_key_down down-line-or-beginning-search;



#package:zsh-syntax-highlighting
#repo:https://github.com/zsh-users/zsh-syntax-highlighting
zsh_syntax_highlighting_path='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh';
[[ -f $zsh_syntax_highlighting_path ]] && source $zsh_syntax_highlighting_path;

