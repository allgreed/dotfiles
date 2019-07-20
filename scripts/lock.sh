#!/usr/bin/env bash

# saves the state of mute
#~/aliases/volume mstat > /tmp/muted 

# in mem path
screen_path="/media/ramdisk/screen-dump.png"

# does a screenshot
scrot -z $screen_path

# fuzz
convert $screen_path -filter point -resize 10% -resize 1000% -paint 3 $screen_path

# main
#~/aliases/volume mute
i3lock -n -i $screen_path

# returns to previes mute state
#if [ `cat /tmp/muted` = "false" ]
#then
#    ~/aliases/volume unmute
#fi

