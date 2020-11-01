# dotfiles

My collection of preferences, configs, /etc.
They work in tandem with [my Nixos configuration](https://github.com/allgreed/nixos-config), but for reasons™ I'm keeping them separate 

## Note on portability

This config is intended for NixOs, however should be fairly usable on Debian-based systems. For work purposes I'm targeting Ubuntu. Your milage may vary.

### What's definitely not portable yet
- paths on i3 config <- mainly autostart stuff, installed with Nix on Ubuntu
- paths on xinitrc <- same as above
- paths contrib blocks path of i3blocks
- there is something funky going on about starting pulseaudio

## Shoutout

Kudos to @niburu for walking me through xkb config!
