# vim: set filetype=sh :


alias gs="git s"
alias gp="git p"
alias g="git"
alias make="make-git-aware"
alias m="make"

alias tf="terraform"
alias py="ptpython" # better Python shell for quick experiments

alias ..="cd .."
alias ...="..; .."

alias mv='mv -i'
alias shred='shred -uvzn1'
alias less='less -q'

alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -Ah'

alias volume="~/.scripts/volume --signal 10"

# better Python names, but respecting virtualenvs
alias python2="/usr/bin/env python"
alias python="/usr/bin/env python3"
alias python3="/usr/bin/env python3.6"

# magnetic trace still can be recovered from hdd after ~7 rewrites
alias shred-hdd='shred -uvzn9'

alias dhcprc="sudo dhclient -r; sudo dhclient -v; ping wp.pl -c 2"

alias vtmp="vim ~/tmp"


transfer()
{
    curl --upload-file $1 https://transfer.sh/$(basename $1); printf "\n"
}


tmp() {
    pushd .
    cur_dir="$HOME/scratch"
    new_dir="/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}


##############
# Typos
##############
alias cd..="cd .."

alias dokcer=docker

alias xit=exit
alias exi=exit
alias :q=exit
alias :wq=exit
alias sl='ls'

alias kubect=kubectl

##############
# WIP
##############

# this should be standardized once my PyCharm installations are automated
alias charm="charm . &"

# TODO: Dafuq is this?????
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Ah' # <- this isn't the default!
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias yyy="g call -m \"$(date)\"; gp"
alias ka="kubectl apply -f ."
alias k="kubectl"
alias pr="hub pull-request"
sudo()
{ 
    if &>/dev/null which 'doas'; then
        doas $@
    else
        unset sudo
        sudo $@ 
    fi
}
alias cdd="cd ~/Desktop"
alias ls='ls -Ah'
alias which='which -a'
alias jozef="vlc ~/Music/Only_Lover_Left_Alive_Full_OST.opus"
