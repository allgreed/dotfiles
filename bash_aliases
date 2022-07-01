# vim: set filetype=sh :

### black magic fuckery ###
alias make="make-git-aware"
alias python2="/usr/bin/env python" # better Python names, but respecting virtualenvs
alias python="/usr/bin/env python3"

### shortcuts ###
alias gs="git s"
alias gp="git p"
alias g="git"
alias m="make"
alias t="task"
alias py="ptpython" # better Python shell for quick experiments
alias ..="cd .."
alias ...="..; .."
alias ll='ls -lh'
alias l='ls -Ah'
alias ka="kubectl apply -f ."
alias k="kubectl"
alias pr="hub pull-request"
alias led="vim $LEDGER_FILE"
alias ulock="ssh-add ~/.ssh/id_ed25519"

### defaults ###
alias mv='mv -i'
alias shred='shred -uvzn1'
alias less='less -q'
alias which='which -a'
alias hledger-iadd="\hledger-iadd --date-format='%d[.[%m[.[%Y]]]]'"
alias ls='ls -Ah'
alias hledger="hledger --infer-market-price"
alias cal="cal -s3"

### typos ###
alias cd..="cd .."
alias dokcer=docker
alias xit=exit
alias exi=exit
alias :q=exit
alias :wq=exit
alias sl='ls'
alias kubect=kubectl
alias kubeclt=kubectl
alias scratch="tmp"

### custom ###
alias volume="~/.scripts/volume --signal 10"
alias shred-hdd='shred -uvzn9' # magnetic trace still can be recovered from hdd after ~7 rewrites
alias dhcprc="sudo dhclient -r; sudo dhclient -v; ping wp.pl -c 2"
alias vtmp="vim ~/tmp"
alias jozef="vlc ~/Music/Only_Lover_Left_Alive_Full_OST.opus"
alias adtransaction="hledger-iadd"
alias kogut="play ~/Music/sounds/kogut.mp3"
alias success="play ~/Music/sounds/gta_miszyn_aczomplit.mp3"
alias update-timezone="systemctl start tzupdate.service; curl ipinfo.io"
alias yearly-report="hledger is -M --effective -X `hledger-get-default-currency` --flat -2 -p thisyear"
alias monthly-report="yearly-report -p thismonth"
alias mon="monthly-report"
alias today="date +%d-%m-%Y"
alias show="command bat"
alias bat="echo 5" # TODO: until proper battery script
 
### functions ###
tmp() {
    # doesn't work well as a seperate script
    pushd .
    cur_dir="/tmp/scratch"
    new_dir="/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}

countdown() {
    \et $1 $2 && kogut
}
alias et="countdown"

latest_shot() {
    find ~/Shots | sort | tail -n 1
}

vim() {
  OWNER=$(stat -c '%U' $1 2> /dev/null || echo 'groot')
  if [[ "$OWNER" == "root" ]]; then
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    printf "File in question ${RED}is owned by root${NC} checking privilage...\n"
    sudo nvim $*;
  else
    nvim $*;
  fi
}

### snowflake ###
if which dircolors 2>&1 >/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Ah'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

##############
# TESTING AREA
##############
alias subs-hear="grep -E '\]$' -v"
alias alert='dunstify --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias hbs="hledger bs --no-elide"

# space after alias does magic!
