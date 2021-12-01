# vim: set filetype=sh :


alias gs="git s"
alias gp="git p"
alias g="git"
alias make="make-git-aware"
alias m="make"

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
    cur_dir="/tmp/scratch"
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
alias kubeclt=kubectl

##############
# WIP
##############

# this should be standardized once my PyCharm installations are automated
alias charm="charm . &"

# TODO: Dafuq is this?????
#if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto' # <- this isn't the default!

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#else
#fi
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

dirupshift()
{
    arg=${1%/}
    # TODO: this returns 1, but works o.0 - fix it
    mv "$arg/*" "$arg/.[^.]*" . 2>/dev/null
    rmdir "$arg/"
}

alias yyy="g call -m \"$(date)\"; gp"
alias ka="kubectl apply -f ."
alias k="kubectl"
alias pr="hub pull-request"
alias ls='ls -Ah --color=auto'
alias which='which -a'
alias jozef="vlc ~/Music/Only_Lover_Left_Alive_Full_OST.opus"

alias adtransaction="\hledger-iadd --date-format='%d[.[%m[.[%Y]]]]'"
alias hledger-iadd="hledger-iadd --date-format='%d[.[%m[.[%Y]]]]'"
alias kogut="play ~/Music/sounds/kogut.mp3"
alias success="play ~/Music/sounds/gta_miszyn_aczomplit.mp3"
countdown()
{
    \et $1 $2 && kogut
}
alias et="countdown"

# TODO: fix this
jf() {
  xclip -selection clipboard | jq '.' | tee /dev/fd/2 | xclip -selection clipboard -o
}

alias update-timezone="systemctl start tzupdate.service; curl ipinfo.io"

alias yearly-report="hledger is -M --effective -X `hledger-get-default-currency` --flat -2"
alias monthly-report="yearly-report -p thismonth"
alias mon="monthly-report"
latest_shot() {
    find ~/Shots | sort | tail -n 1
}

function vim(){
  OWNER=$(stat -c '%U' $1)
  if [[ "$OWNER" == "root" ]]; then
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    printf "File in question ${RED}is owned by root${NC} checking privilage...\n"
    sudo nvim $*;
  else
    nvim $*;
  fi
}

ns() {
    kubectl config set-context --current --namespace=$1
}

flash_ergdox() {
    file=$(ls ~/Downloads/ergodox_ez_shine_allgreed_* | dmenu)
    sudo wally-cli $file && rm $file
}

# is this needed anymore?
alias tf="terraform"

alias scratch="tmp"
alias subs-hear="grep -E '\]$' -v"
