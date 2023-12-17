start=$(date +%s.%N)
# Guards
#########################
case $- in
    *i*) ;;
      *) return;;
esac
# TODO: what exactly does this do? o.0

# poor man's display manager xD
if [[ "$(tty)" == '/dev/tty1' ]]; then
    exec startx
fi

# fixes nix-shell and sometimes ssh
if [ "$TERM" = 'rxvt-unicode-256color' ]; then
    export TERM='xterm-256color'
fi

source ~/.config/bash/bootstrap

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
load 'git prompt' $(_resolve_nix git share/bash-completion/completions/git-prompt.sh) @fin
load 'prompt' ~/.config/bash/prompt
load 'nix integration' @nixos ~/.nix-profile/etc/profile.d/nix.sh
load 'home-manager integration' ~/.nix-profile/etc/profile.d/hm-session-vars.sh
load 'bash autocomplete' @nixos /usr/share/bash-completion/bash_completion
load 'git autocomplete' $(_resolve_nix git share/bash-completion/completions/git) /usr/share/bash-completion/completions/git
load 'task autocomplete' $(_resolve_nix task share/bash-completion/completions/task.bash) @fin

load 'autojump' $(_resolve_nix autojump share/autojump/autojump.bash)
# this worked really well for ~2 years, I'm running it now alongside autojump, will see :D
export CDPATH=.:~/Desktop
lastcd="/tmp/.$USER-lastcd"
function cd {
    builtin cd "$@" 
    pwd > $lastcd
}
function lcd {
    if [ -n $lastcd ]; then
        cd $(cat $lastcd)
    fi 
}

# this needs to happen after autocompletes
# TODO: this adds ~50ms
load 'aliases' ~/.config/bash/aliases

# I want this to overwrite almost everything
load 'local stuff' ~/.bash_local @fin

# this has to happen after all prompts are loaded
load 'direnv integration' @eval "direnv hook bash"

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


# Testing area
#########################
# TODO: i3 -> when openning a sensible terminal -> check if there are other terminals in the worksapce running bash, if yes: open with the same CWD as the terminal, if there're two, check ~/.lastcd

# what does this even do? o.0 6.07.23
shopt -s dotglob

end=$(date +%s.%N)
read -r -d '' ARG0_PY << '--END'
import sys
from datetime import datetime

_, *a = sys.argv
b = map(float, a)
start, end = map(datetime.fromtimestamp, b)

diff = end - start

print(f".bashrc took ~{diff.microseconds / 10 ** 3}ms")
--END
python3 -c "$ARG0_PY" $start $end
