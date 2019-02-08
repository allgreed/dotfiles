# vim: set filetype=sh :

# moving around
alias ..="cd .."
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# JetBrains' IDEs
alias charm="charm . &"
alias idea="/opt/idea-IC-182.4892.20/bin/idea.sh &"

# Git
alias gs="git s"
alias g="git"

# Custom scripts
alias weather='curl wttr.in/Gdansk -s | head -n 17'

# better Python names, but respecting virtualenvs
alias python2="/usr/bin/env python"
alias python="/usr/bin/env python3"
alias python3="/usr/bin/env python3.6"

alias nodeon="nvm use default"
alias tf="terraform"

# temporary thing I have to run on every startup on 2 of my machines, will automate it soon!
alias start="cat ~/Dotfiles/ansible/notes.txt | grep xmod | bash; ~/.scripts/kill-xcape; xcape"

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

transfer()
{
    curl --upload-file $1 https://transfer.sh/$(basename $1); printf "\n"
}
