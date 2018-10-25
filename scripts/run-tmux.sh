SESSION_PREFIX="tmp-"

if [ -z "$TMUX" ]; then
    for (( i=0; ; i++ ))
    do
        if ! tmux has-session -t=$SESSION_PREFIX$i 2> /dev/null
        then
            tmux new-session -s $SESSION_PREFIX$i;
            break
        fi
    done
fi
