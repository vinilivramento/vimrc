# vimrc
My vimrc basic configuration.

## Install fzf

- add to bashrc:
export FZF\_DEFAULT\_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node\_modules}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

## Install ripgrep
