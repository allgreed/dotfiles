{ config, pkgs, ... }:

let
  nur = import (builtins.fetchGit {
    url = "https://github.com/nix-community/NUR";
    ref = "refs/heads/master";
    rev = "859d801541585ce1b5c41879d7e95adcaea023a1"; # 20-06-2024
    # obtain via `git ls-remote https://github.com/nix-community/NUR master`
  }) {
    inherit pkgs;
  };
in
{
  programs.firefox = {
    enable = true;
    # TODO: a Null package? that accepts every action, but doesn't actually output anything...?
    #package = pkgs.htop;
    profiles = {
      myprofile = {
        settings = {
          "browser.ctrlTab.recentlyUsedOrder" = false;
          "browser.sessionstore.warnOnQuit" = true;
          "browser.showQuitWarning" = true;
          "browser.warnOnQuit" = true;
          "browser.sessionstore.restore_tabs_lazily" = false;
          "signon.rememberSignons" = false;
          "dom.private-attribution.submission.enabled" = false;
          # HTTPS-Only Mode <- enable in all windows - how to?
        };


        # TODO: add StartPage and make it the default search engine
        # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.profiles._name_.search.engines
        extensions = with nur.repos.rycee.firefox-addons; [
          bitwarden
          vimium
          ublock-origin
          videospeed
          polish-dictionary
          news-feed-eradicator
          # wasn't this having some problems? o.0
          solarized-light
          # also: cleanlinks # supposedly redundant with certain ublock-origin settings, afaik removeparam
          # I don't care about cookies
          # skip-redirect - 12.03.2023 -> trying it out
          # Multiple Tab Handler
        ];
      };
    };
  };

  programs.htop = {
    settings = {
      enable = true;
      cpuCountFromZero = true;
      showCpuUsage = true;
      colorScheme = 6;
      highlightBaseName = true;
      vimMode = true;
    };
  };

  manual.html.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "solarized-light"
  ];

  home.packages = with pkgs; [
    xournal # pdf manipulation and annotation

    # TODO: check this out
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # TODO: when home.file is useful?

  # TODO: can I use a hybrid approach? :D
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/allgreed/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # boilerplate
  programs.home-manager.enable = true;
  home.username = "allgreed";
  home.homeDirectory = "/home/allgreed";
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
