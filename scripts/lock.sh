#!/usr/bin/env bash

# prepare
###############################
# saves the state of mute
#~/aliases/volume mstat > /tmp/muted 
screen_path="/media/ramdisk/screen-dump.png" # in mem path is a good idea
scrot -z $screen_path
convert $screen_path -filter point -resize 10% -resize 1000% -paint 3 $screen_path

# lock
###############################
#~/aliases/volume mute
physlock -lds
i3lock -n -i $screen_path

# unlock
###############################
physlock -Lds

# returns to previous mute state
#if [ `cat /tmp/muted` = "false" ]
#then
#    ~/aliases/volume unmute
#fi

