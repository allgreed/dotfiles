# dotfiles

My collection of preferences, configs, /etc.
They work in tandem with [my Nixos configuration](https://github.com/allgreed/nixos-config), but for reasons™ I'm keeping them separate 

## Note on portability

This config is intended for NixOs, however should be fairly usable on Debian-based systems. For work purposes I'm targeting Ubuntu. Your milage may vary.

For those reasons, and since it's used by more than one machine - there is some interesting stuff going on with git filters. Additionall checkout upon clone *might* be required.

## Local overrides

In rare cases I'd like to make changes to the dotfiles that would only have effect on the current machine. This should be avoided when it reasonably can be. Each local override has to be treated like a special case and supported explicitly in relevant place.

### Currently supported overrides:
- .Xresources.local
- .autostart.local <- a shell script
- .wp-overlay.local <- .png image that will be composed into the wallpaper, usefull to quickly differenciate machines
- ~/.bash_local

## Shoutout

Kudos to @niburu for walking me through xkb config!
