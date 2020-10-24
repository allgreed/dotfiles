#!/bin/bash
numlockx on
xcape -e 'Caps_Lock=Escape;Control_L=Escape'
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
# this is for my T420 - I have scandinavic keyboard with >< character at the expense of left Shift
# TODO: is this needed anymore with my migration to X230? - test on Connor and Sarah
xmodmap -e "keycode 94 = Shift_L"
unclutter &
#pulseaudio --start <- is this causing pulseaudio failure on Nixos?
redshift-gtk -c ~/.redshift.conf
exec i3
