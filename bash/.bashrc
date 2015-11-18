### Defaults

if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

### Git

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi

### History

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

### Less

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### Prompt

case "$TERM" in
    xterm|xterm-color|screen-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}'\
'\[\e[38;5;7m\]\D{%H:%M} \j\[\e[00m\] '\
'\[\e[1;77m\]\u@\h\[\e[00m\] '\
'\[\e[38;5;92m\]\W\[\e[00m\]'\
'$(__git_ps1 " \[\e[38;5;208m\]%s\[\e[00m\]")'\
' \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\A \u@\h \W\$ '
fi
unset color_prompt force_color_prompt

### Other colors

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

### Terminal title

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


### Aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### bash-completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
