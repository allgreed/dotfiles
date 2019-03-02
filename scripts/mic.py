#!/usr/bin/env python3
# depends on amixer package
"""Control microphone behaviour"""

import subprocess

import click


commands = {
    "mute": "amixer set Capture nocap",
    "toggle": "amixer set Capture toggle",
}


@click.group()
def cli():
    pass

def make_simple_command(action):
    @click.command()
    def command():
        subprocess.run(action, shell=True, check=True)

    return command

def main():
    for name, action in commands.items():
        cli.add_command(make_simple_command(action), name)

    cli()


if __name__ == "__main__":
    main()
