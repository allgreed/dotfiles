# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#################################################
#################################################
#################################################
#################################################
#################################################
#################################################

# TODO: read the above carefully

# load my utility function that simplify the rest of the config
source ~/.bash_utilities
# TODO: Move this to scripts unser load.sh

# Env
#########################
PATH_LOCAL_BINARIES=$HOME/.local/bin
PATH_ROOT_BINARIES=/sbin/:/usr/sbin
PATH_SCRIPT_BINARIES=$HOME/.scripts/bin
PATH=$PATH_LOCAL_BINARIES:$PATH_SCRIPT_BINARIES:$PATH:$PATH_ROOT_BINARIES
export PATH

# fixes nix-shell and sometimes ssh
if [ "$TERM" = 'rxvt-unicode-256color' ]; then
    export TERM='xterm-256color'
fi

# Shell behaviour
#########################
HISTSIZE=1000000
HISTFILESIZE=4000000
shopt -s histappend
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.

set -o vi; # vim in bash
stty -ixon # disable ctrl+s - no more accidental weird freezes

# Extensions
#########################
load ~/.bash_aliases # my custom aliases
load ~/.bash_prompt # my fancy prompt

# Autocompletes
#########################
load /usr/share/bash-completion/bash_completion
load /usr/share/bash-completion/completions/git

__git_complete g __git_main # apply full git completion to "g" alias
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" m # apply Make completion to 'm' alias

# Shell integrations
#########################
load ~/.nix-profile/etc/profile.d/nix.sh
eval "$(direnv hook bash)"

# Testing area
#########################
function cd {
    builtin cd $@
    pwd > ~/.lastcd
}
alias lcd="cd $(cat ~/.lastcd)"

# Disable bell for less
export PAGER='less -q'
