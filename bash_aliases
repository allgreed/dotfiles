# vim: set filetype=sh :

# moving around
alias ..="cd .."
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

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

transfer()
{
    curl --upload-file $1 https://transfer.sh/$(basename $1); printf "\n"
}

##############
# Typos
##############
alias dokcer=docker
alias xit="exit"
alias exi="exit"
alias cd..="cd .."
alias :q=exit

##############
# WIP
##############

alias volume="~/.scripts/volume --signal 10"

# temporary thing I have to run on every startup on 2 of my machines, will automate it soon!
alias start="cat ~/Dotfiles/ansible/notes.txt | grep xmod | bash; pkill xcape; xcape"

# this should be standardized once my PyCharm installations are automated
alias charm="charm . &"
alias idea="/opt/idea-IC-182.4892.20/bin/idea.sh &"

# node should be loaded by default to every shell, but without startup time overhead
alias nodeon="nvm use default"

# TODO: Dafuq is this?????
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# containerized :D
alias go='docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.11 go'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
