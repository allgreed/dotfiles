# dotfiles

My collection of preferences, configs, /etc. Feel free to share, copy, modify (not on this repo, though ;p)

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
