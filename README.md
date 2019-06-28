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
<-- Add some moar kudos, inf, olo, ??? -->
