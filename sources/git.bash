#!/usr/bin/env bash

# Add git branch to commandline
git_branch() {
	if [[ $(is_git) == "true" ]]; then
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	fi
}

has_git_changes() {
	if [[ $(is_git) == "true" && $(git status --porcelain) ]]; then
		#echo "✗"
		echo " `git diff --shortstat | sed -E 's/^.*file(s)? changed, //' | sed -E 's/ insertion.*, /+ /' | sed -E 's/ deletion(s)?\(-\)/-/'`"
	fi
}


git_prefix() {
	if [[ $(is_git) == "true" ]]; then
		echo " ±:"
	fi
}

is_git() {
	if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
		echo "true"
	else
		echo "false"
	fi;
}

GIT_PROMPT='\[\033[01;30m\]$(git_prefix)\[\033[00m\]\[\033[01;34m\]$(git_branch)\[\033[00m\]\[\033[01;30m\]$(has_git_changes)\[\033[00m\]'
BASHRC_PROMPT="$BASHRC_PROMPT$GIT_PROMPT"
