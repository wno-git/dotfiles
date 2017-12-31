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

function set_ps {
    local color_prompt
    color_prompt=$1

    local color_white_lo
    local color_white_hi
    local color_purple
    local color_orange
    local color_reset

    # Don't run tput unless color prompt is requested. TERM variable is
    # assumed to be set if color prompt is requested. tput will not work without
    # it.
    if [ "$color_prompt" = true ]; then
        color_white_lo="\[$(tput setaf 7)\]"
        color_white_hi="\[$(tput setaf 15)\]"
        color_purple="\[$(tput setaf 92)\]"
        color_orange="\[$(tput setaf 208)\]"
        color_reset="\[$(tput sgr0)\]"
    fi

    local ps_time
    local ps_jobs
    local ps_user_host
    local ps_dir
    local ps_uid
    ps_time="\D{%H:%M}"
    ps_jobs="\j"
    ps_user_host="\u@\h"
    ps_dir="\W"
    ps_uid="\$"

    local ps_git
    if [ "$(type -t __git_ps1)" = function ]; then
        ps_git="\$(__git_ps1 \"%s \")"
    else
        ps_git=""
    fi

    local ps_color
    ps_color="${color_white_lo}${ps_time} ${ps_jobs} "\
"${color_white_hi}${ps_user_host} "\
"${color_purple}${ps_dir} "\
"${color_orange}${ps_git}"\
"${color_white_lo}${ps_uid}${color_reset} "

    local ps_no_color
    ps_no_color="$ps_time $ps_jobs $ps_user_host $ps_dir $ps_git $ps_uid "

    if [ "$color_prompt" = true ]; then
        PS1=$ps_color
    else
        PS1=$ps_no_color
    fi
}

prompt_256color=false
case "$TERM" in
    xterm-256color)
        prompt_256color=true ;;
    screen-256color)
        prompt_256color=true ;;
esac

set_ps "$prompt_256color"

### Other colors

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

source "$HOME/.bazel/bin/bazel-complete.bash" || true
