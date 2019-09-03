#!/usr/bin/env python3


plugins = [
    "vimium-ff",
    "ublock-origin",
    "lastpass-password-manager",
    "https-everywhere",
    "news-feed-eradicator",
]


def main():
    for p in plugins:
        print("Install {0}, at: https://addons.mozilla.org/en-US/firefox/addon/{0}/".format(p))

        while True:
            user_input = input("Type 'n' and press 'Enter' to continue: ")
            if user_input == "n":
                break

    print("FIN :D")


if __name__ == "__main__":
    main()
