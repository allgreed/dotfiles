#!/usr/bin/env python3
from datetime import datetime, timedelta

now = datetime.now()

mod = 1 if now.hour >= 9 else 0

now_date = now.date()
refernce = datetime(now_date.year, now_date.month, now_date.day + mod, 9) 

diff = refernce - now

# TODO: use xresources
if diff > timedelta(hours=8):
    color = "#93a1a1" # 14
elif diff > timedelta(hours=6):
    color = "#b58900" # 3
else:
    color = "#dc322f" # 1

formatted_diff = str(timedelta(seconds=diff.seconds))

print("{0}\n{0}\n{1}".format(formatted_diff, color))
