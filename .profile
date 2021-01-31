#!/bin/bash
# This file runs once at login.

# Add all local binary paths to the system path.
export PATH="$PATH:$HOME/.local/bin"

# Default programs to run.
export EDITOR="vim"
export READER="zathura"
export FILE="ranger"

# Add colors to the less and man commands.
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# If bash is the login shell, then source ~/.bashrc if it exists.
echo "$0" | grep "bash$" >/dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
<<<<<<< HEAD
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
=======

>>>>>>> 50e4b939a768d5b542a8d99779ac176f5fcd5a8e
