#!/usr/bin/env python3


plugins = [
    "news-feed-eradicator",
    "polish-spellchecker-dictionary",
]


def main():
    for p in plugins:
        print("Install {0}, at: https://addons.mozilla.org/en-US/firefox/addon/{0}/".format(p))

        while True:
            user_input = input("Type 'n' and press 'Enter' to continue: ")
            if user_input == "n":
                break

    print("Done, now turn them on! :D")


if __name__ == "__main__":
    main()
