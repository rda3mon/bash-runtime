# bash-runtime 

A bash configuration suitable for developers

# Installation

* Clone the repo `git clone git@github.com:rda3mon/bash-runtime.git ~/.bash_runtime`
* `echo -e "\nBASHRC_PATH=~/.bash_runtime\nsource $BASHRC_PATH/bashrc" >> ~/.bashrc` or `echo -e "\nBASHRC_PATH=~/.bash_runtime\nsource $BASHRC_PATH/bashrc" >> ~/.bash_profile` based on the environment

# Uninstallation

Remove `BASHRC_PATH=~/.bash_runtime` and `source \$BASHRC_PATH/bashrc` from `.bashrc` or `.bash_profile`

# TODO

* Autocomplete modules
* A suitable Theme
* Programmable completion
* Git colored branch and repo name
