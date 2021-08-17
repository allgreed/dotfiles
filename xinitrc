#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources
xrdb -merge ~/.Xresources.local

xcape -e 'Caps_Lock=Escape;Control_L=Escape;Shift_R=parenright;Shift_L=parenleft'
xmodmap ~/.Xmodmap
# this is for my T420 - I have scandinavic keyboard with >< character at the expense of left Shift
# TODO: is this needed anymore with my migration to X230? - test on Connor and Sarah
xmodmap -e "keycode 94 = Shift_L"

numlockx on
unclutter &

PATH=/home/$(whoami)/.nix-profile/bin:$PATH TERMINAL='urxvt' exec i3
