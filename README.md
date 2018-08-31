# dotfiles

My collection of preferences, configs, /etc.

## Prerequisites

- git
- ansible
- python (required by ansible)

### Installation (with apt)

```
test -e /usr/bin/git || (sudo apt-get update && sudo apt install -y git)
test -e /usr/bin/python || (sudo apt-get update && sudo apt install -y python)
test -e /usr/bin/ansible || (sudo apt-get update && sudo apt install -y ansible)
```

## Installation

```sh
git clone https://github.com/allgreed/dotfiles.git ~/Dotfiles
~/Dotfiles/ansible/run
```


<!-- DEAL WITH THIS STUFF BELOW -->

## Requiremenets

- `startup.sh` requires to be called by a service at startup

## xkb config

Append this to `/usr/share/X11/xkb/symbols/pl` 

```
    // both Shifts act like Capslock
    include "shift(both_capslock)"
    // remaps Capslock to ESC
    include "capslock(escape)"
```

Kudos to niburu for walking me through this one!
