# Guards
#########################
case $- in
    *i*) ;;
      *) return;;
esac

# poor man's display manager xD
if [[ "$(tty)" == '/dev/tty1' ]]; then
    TERMINAL='urxvt' exec startx
fi

# Bootstrap
#########################
function load
{
    name="$1"; shift

    for path in $@; do
        # @nixos means that the utility is already provided by Nixos and
        # doesn't require additional loading
        if [[ "$path" == '@nixos' && -n __NIXOS_SET_ENVIRONMENT_DONE ]]; then
            return 
        fi 

        if [ -n "$path" ]; then
            2> /dev/null source $path && return 
        fi 
    done

    echo "Loading failed for $name, cannot source any of the: $@"
}

#################################################
#################################################
#################################################
#################################################
#################################################
#################################################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# TODO: see some of those examples and remove this comment

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#################################################
#################################################
#################################################
#################################################
#################################################
#################################################
# TODO: read the above carefully

# Env
#########################
# TODO: since it's not needed on nixos -> move this to a helper utility and load
PATH_LOCAL_BINARIES=$HOME/.local/bin
PATH_ROOT_BINARIES=/sbin/:/usr/sbin
PATH_SCRIPT_BINARIES=$HOME/.scripts/bin
PATH=$PATH_LOCAL_BINARIES:$PATH_SCRIPT_BINARIES:$PATH:$PATH_ROOT_BINARIES
export PATH

# fixes nix-shell and sometimes ssh
if [ "$TERM" = 'rxvt-unicode-256color' ]; then
    export TERM='xterm-256color'
fi

export VISUAL=vim
export EDITOR=vim
export PAGER='less -q' # disable bell for less

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
load 'aliases' ~/.bash_aliases
load 'prompt' ~/.bash_prompt
load 'nix integration' @nixos ~/.nix-profile/etc/profile.d/nix.sh
load 'bash autocomplete' @nixos /usr/share/bash-completion/bash_completion
load 'git autocomplete + helpers' $(dirname $(readlink -f $(which git)))/../share/bash-completion/completions/git /usr/share/bash-completion/completions/git
eval "$(direnv hook bash)"

# Autocompletes
#########################
__git_complete g __git_main # apply full git completion to "g" alias
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" m #" 
complete -cf doas

# Testing area
#########################
function cd {
    builtin cd $@
    pwd > ~/.lastcd
}
alias lcd="cd $(cat ~/.lastcd)"
