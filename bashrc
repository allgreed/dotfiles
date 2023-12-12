# Guards
#########################
case $- in
    *i*) ;;
      *) return;;
esac

# poor man's display manager xD
if [[ "$(tty)" == '/dev/tty1' ]]; then
    exec startx
fi

# fixes nix-shell and sometimes ssh
if [ "$TERM" = 'rxvt-unicode-256color' ]; then
    export TERM='xterm-256color'
fi

# Bootstrap
#########################
function load
{
    name="$1"; shift

    while [ -n "$1" ]; do
        # @nixos means that the utility is already provided by Nixos and
        # doesn't require additional loading
        if [[ "$1" == '@nixos' && -n "$__NIXOS_SET_ENVIRONMENT_DONE" ]]; then
            return 
        fi 

        if [[ "$1" == '@eval' ]]; then
            code=$(eval $2)
            eval "$code" && return
        fi

        # unconditionally stop processing and happily return
        if [[ "$1" == '@fin' ]]; then
            return
        fi

        if [ -n "$1" ]; then
            2> /dev/null source "$1" && return 
        fi 

        shift
    done

    echo "Loading failed for $name, cannot source any of the: $@"
}

# TODO: this is a really bad name
# although not *super* bad - as it really on works with nix, lol
function _resolve_nix
{
    executable="$1"; path="$2"
    echo "$(dirname $(readlink -f $(which $executable)))/../$path"
}

# Env
#########################
# TODO: since it's not needed on nixos -> move this to a helper utility and load
PATH_LOCAL_BINARIES=$HOME/.local/bin
PATH_ROOT_BINARIES=/sbin/:/usr/sbin
PATH_SCRIPT_BINARIES=$HOME/.scripts/bin
PATH=$PATH_LOCAL_BINARIES:$PATH_SCRIPT_BINARIES:$PATH:$PATH_ROOT_BINARIES
export PATH

export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export PAGER='less -q' # disable bell

export PYTHONSTARTUP=~/.config/ptpython/config.py

# cargo needs some special incentive in order to behave
export CARGO_HOME=~/.cache/cargo

export LEDGER_FILE="/home/allgreed/Documents/finance/2023.journal"
export BAT_THEME='Solarized (light)'
export DO_NOT_TRACK=1 # because why not :D

# Shell behaviour
#########################
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
shopt -s histappend cdspell checkwinsize
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
# Change the file location because certain bash sessions truncate .bash_history file upon close.
export HISTFILE=~/.bash_eternal_history

set -o vi; # vim in bash
bind -r '\C-s'
stty -ixon # disable ctrl+s - no more accidental weird freezes

# Extensions
#########################
load 'aliases' ~/.bash_aliases
load 'git prompt' $(_resolve_nix git share/bash-completion/completions/git-prompt.sh) @fin
load 'prompt' ~/.bash_prompt
load 'nix integration' @nixos ~/.nix-profile/etc/profile.d/nix.sh
load 'home-manager integration' ~/.nix-profile/etc/profile.d/hm-session-vars.sh
load 'local stuff' ~/.bash_local @fin

load 'autojump' $(_resolve_nix autojump share/autojump/autojump.bash)
# this worked really well for ~2 years, I'm running it now alongside autojump, will see :D
export CDPATH=.:~/Desktop

# this has to happen after all prompts are loaded
load 'direnv integration' @eval "direnv hook bash"


# Autocompletes
#########################
load 'bash autocomplete' @nixos /usr/share/bash-completion/bash_completion
load 'git autocomplete' $(_resolve_nix git share/bash-completion/completions/git) /usr/share/bash-completion/completions/git
load 'task autocomplete' $(_resolve_nix task share/bash-completion/completions/task.bash) @fin
__git_complete g __git_main # apply full git completion to "g" alias
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" m #" 
complete -cf doas
complete -o nospace -F _task t

# Testing area
#########################
# TODO: need something better than this! <- this fails at paths that have spaces, doesn't record history for frequency/latest-based autocomplete, etc
function cd {
    builtin cd "$@"
    pwd > ~/.lastcd
    ls
}
alias lcd="cd $(cat ~/.lastcd)"
# TODO: would autojump help here?

# what does this even do? o.0 6.07.23
shopt -s dotglob
