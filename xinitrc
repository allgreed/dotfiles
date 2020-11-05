#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources

xcape -e 'Caps_Lock=Escape;Control_L=Escape'
xmodmap ~/.Xmodmap
# this is for my T420 - I have scandinavic keyboard with >< character at the expense of left Shift
# TODO: is this needed anymore with my migration to X230? - test on Connor and Sarah
xmodmap -e "keycode 94 = Shift_L"

numlockx on
unclutter &

TERMINAL='urxvt' exec i3
