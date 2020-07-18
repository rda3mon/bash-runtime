#!/usr/bin/env bash

# Ignore commands with leading space and consecutive duplicate commands
HISTCONTROL=ignoreboth # equals HISTCONTROL=ignorespace:ignoredups

# unlimited history
HISTSIZE=
HISTFILESIZE=

# history format
HISTTIMEFORMAT="%d/%m/%y %T "

# append to history and don't override
shopt -s histappend

# append multi-line commands as one command
shopt -s cmdhist

# ignore these in history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# immediate save history
PROMPT_COMMAND='history -a'

# check window size before priting each line. Helps when window is resized
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]➜ \[\033[00m\][\[\033[01;34m\]\W\[\033[00m\]]\[\033[01;31m\]$(git_branch)\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi

unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Disable redirection override file, instead use >|
set -o noclobber

# Case insensitive tab path expansion
#shopt -s nocaseglob

bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"

# Spelling corrections in cd arguments
shopt -s cdspell

# Favorite directory
CDPATH='.:..:../..:~/Devel:~'

# Use ~- to specify previous navigated directory
