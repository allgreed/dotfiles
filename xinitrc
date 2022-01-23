#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources
xrdb -merge ~/.Xresources.local

xcape -e 'Caps_Lock=Escape;Control_L=Escape;Shift_R=parenright;Shift_L=parenleft;ISO_Level3_Shift=equal'
xmodmap ~/.Xmodmap
numlockx on

PATH=/home/$(whoami)/.nix-profile/bin:$PATH TERMINAL='urxvt' exec i3
