#!/usr/bin/env python3
from datetime import datetime, timedelta
import subprocess

def py_xgetres(res: str):
    """A really shitty ad hoc implementation of xgetres, totally non-portable and probably will fail for your .Xresources
    
    Feel free to replce it with a legit exec once someone ports xgetres from aur(tm) to nix
    """
    p = subprocess.check_output(["xrdb", "-query"])  # py35 compatibility
    entry_tokens = p.decode("utf-8").split("\n")
    fuj_entries = map(lambda s: s.split(":"), entry_tokens)
    entries = filter(lambda l: len(l) == 2, fuj_entries)
    resource_map = { k.lstrip("*"): v.lstrip() for k, v in entries }
    return resource_map[res.lstrip(".")]


def main():
    now = datetime.now()

    next_day_hours = 24 if now.hour >= 9 else 0
    now_date = now.date()

    refernce = datetime(now_date.year, now_date.month, now_date.day, 9) + timedelta(hours=next_day_hours)

    diff = refernce - now

    if diff > timedelta(hours=9):
        color = py_xgetres(".color14")
    elif diff > timedelta(hours=8):
        color = py_xgetres(".color13")
    else:
        color = py_xgetres(".color1")

    formatted_diff = str(timedelta(seconds=diff.seconds))

    print("{0}\n{0}\n{1}".format(formatted_diff, color))

    if diff < timedelta(hours=7):
        exit(33)  # sets urgent flag on i3blocks

if __name__ == "__main__":
    main()

