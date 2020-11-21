#!/usr/bin/env bash
set -o xtrace

# prepare
screen_path="/tmp/screen-dump.png"
escrotum $screen_path
convert $screen_path -filter point -resize 10% -resize 1000% -paint 3 $screen_path

# pre-lock
physlock -lds
ssh-add -D

# actual lock
i3lock-color -n -i $screen_path --ignore-empty-password --pass-volume-keys

# unlock
physlock -Lds
