# vim: set filetype=sh :

# moving around
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -Ah'

# JetBrains' IDEs

# Git
alias gs="git s"
alias g="git"

# Custom scripts
# better Python names, but respecting virtualenvs
alias python2="/usr/bin/env python"
alias python="/usr/bin/env python3"
alias python3="/usr/bin/env python3.6"


alias tf="terraform"
alias py="ptpython" # better Python shell for quick experiments

alias m="make"

transfer()
{
    curl --upload-file $1 https://transfer.sh/$(basename $1); printf "\n"
}

scratch() {
    pushd .
    cur_dir="$HOME/scratch"
    new_dir="/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}

alias vtmp="vim ~/tmp"

##############
# Typos
##############
alias cd..="cd .."

alias dokcer=docker

alias xit=exit
alias exi=exit
alias :q=exit
alias :wq=exit
alias :x=exit

##############
# WIP
##############

alias volume="~/.scripts/volume --signal 10"

alias dhcprc="sudo dhclient -r; sudo dhclient -v; ping wp.pl -c 2"

# this should be standardized once my PyCharm installations are automated
alias charm="charm . &"

alias ..="cd .."
alias ...="..; .."

# TODO: Dafuq is this?????
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Ah'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
