# dotfiles

My collection of preferences, configs, /etc.

## Prerequisites

- git
- ansible >=2.6.3
- python2 >=2.7.13 (required by ansible)

### Prerequisites installation (with apt)

```
sudo apt-get update
sudo apt install -y git python ansible sudo
```

## Installation

```sh
git clone https://github.com/allgreed/dotfiles.git ~/Dotfiles
~/Dotfiles/ansible/run
```

## Non-obvious folder structure

- `screenlayout` - configuration for xrandr

## Shoutout

Kudos to @niburu for walking me through xkb config!

## Note on portability

This config is intended for NixOs, however should be fairly usable on Debian-based systems. For work purposes I'm targeting Ubuntu. Your milage may vary.

### What's definitely not portable yet
- paths on i3 config <- mainly autostart stuff, installed with Nix on Ubuntu
- paths on xinitrc <- same as above
- paths contrib blocks path of i3blocks
- scripts utilitsing `nix-shell -p` might not work, will test that soon
- there is something funky going on about starting pulseaudio
