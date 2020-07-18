#!/usr/bin/env bash

BASHRC_PROMPT='\[\033[01;31m\][\t]\[\033[00m\] \[\033[01;36m\][\W]\[\033[00m\]'

SOURCES="$BASHRC_PATH"/sources/*.bash
for config in $SOURCES
do
	source "$config"
done

if [[ -z "$BASHRC_PROMPT_TERMINATOR" ]]; then
	BASHRC_PROMPT_TERMINATOR='\[\033[01;33m\]➜\[\033[00m\]'
fi
#BASHRC_PROMPT="${BASHRC_PROMPT}\n${BASHRC_PROMPT_TERMINATOR} "
BASHRC_PROMPT="${BASHRC_PROMPT} ${BASHRC_PROMPT_TERMINATOR} "

if [[ $BASHRC_PROMPT ]]; then
	PS1="$BASHRC_PROMPT"
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
