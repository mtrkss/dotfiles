{ config, ... }:{
programs.bash = {
enable = true;
bashrcExtra = ''
PS1='$USER:\w % '
PAGER=less
EDITOR=vim

alias grep='grep --color=tty'
alias g='grep -Ei'
alias cls='tput clear'
alias h='fc -l'
alias ls='ls --color=tty'
alias l='ls -goph'
alias ll='ls -alph'
alias cls='clear'
alias cp='cp -ip'
alias mv='mv -i'

batclip() {
 bat -f --theme ansi "$1" | sed 's/\x1b\[m//g' | xclip -sel clip
 xclip -sel clip -o
}

'';
};
}
