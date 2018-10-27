SESSION_PREFIX="tmp-"

if [ -z "$TMUX" ]; then
    tmux list-sessions -F "#{session_name}: #{?session_attached,attached,dettached}" \
        | grep ": dettached" \
        | cut -d: -f 1 \
        | grep -P '^tmp-\d+$' \
        | xargs -n 1 tmux kill-session -t

    for (( i=0; ; i++ ))
    do
        if ! tmux has-session -t=$SESSION_PREFIX$i 2> /dev/null
        then
            tmux new-session -s $SESSION_PREFIX$i
            break
        fi
    done
fi
