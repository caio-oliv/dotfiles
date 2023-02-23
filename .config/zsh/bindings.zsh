# zsh key bindings
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins

# in case some of the binded keys are different, use `showkey -a` command to see the ascii
# code of the keystrokes

zsh_key_up='^[[A';
zsh_key_down='^[[B';
zsh_key_left='^[[D';
zsh_key_right='^[[C';

zsh_key_insert='^[[2~';
zsh_key_del='^[[3~';
zsh_key_home='^[[H';
zsh_key_end='^[[F';
zsh_key_pageup='^[[5~';
zsh_key_pagedown='^[[6~';

zsh_key_enter='^M';
zsh_key_backspace='^?';
zsh_key_space=' ';

zsh_key_ctrl_up='^[[1;5A';
zsh_key_ctrl_down='^[[1;5B';
zsh_key_ctrl_left='^[[1;5D';
zsh_key_ctrl_right='^[[1;5C';

zsh_key_ctrl_insert='^[[2;5~';
zsh_key_ctrl_del='^[[3;5~';
zsh_key_ctrl_home='^[[1;5H';
zsh_key_ctrl_end='^[[1;5F';
zsh_key_ctrl_pageup='^[[5;5~';
zsh_key_ctrl_pagedown='^[[6;5~';

zsh_key_ctrl_backspace='^H';
zsh_key_ctrl_space='^ ';

zsh_key_shift_tab='^[[Z';

# bindings

bindkey -e # use emacs key bindings

bindkey $zsh_key_home        beginning-of-line;
bindkey $zsh_key_end         end-of-line;
bindkey $zsh_key_ctrl_left   backward-word;
bindkey $zsh_key_ctrl_right  forward-word;

bindkey $zsh_key_backspace       backward-delete-char;
bindkey $zsh_key_del             delete-char;
bindkey $zsh_key_ctrl_backspace  backward-kill-word;
bindkey $zsh_key_ctrl_del        kill-word;

bindkey $zsh_key_shift_tab  reverse-menu-complete;
