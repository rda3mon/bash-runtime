#!/bin/bash

# Start tmux on shell launch
if command -v tmux > /dev/null && [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
	tmux has-session -t dev
	if [[ $? != 0 ]]; then
		exec tmux -u new -s dev
	else
		exec tmux -u attach -t dev
	fi
fi
