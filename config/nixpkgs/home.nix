{ config, pkgs, ... }:
let
  nur = import (builtins.fetchGit {
    # 2021-11-27
    url = "https://github.com/nix-community/NUR";
    ref = "refs/heads/master";
    rev = "7a85388ffce94fabace9a7a0f9eef4d6ef49c993";
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
    extensions = with nur.repos.rycee.firefox-addons; [
      https-everywhere
      lastpass-password-manager
      vimium
      ublock-origin
      videospeed
      polish-dictionary
      news-feed-eradicator
      # wasn't this having some problems? o.0
      solarized-light
      # also: cleanlinks
      # I don't care about cookies
    ];
    profiles = {
      myprofile = {
        settings = {
          "browser.ctrlTab.recentlyUsedOrder" = false;
          "browser.sessionstore.warnOnQuit" = true;
          "browser.showQuitWarning" = true;
          "browser.warnOnQuit" = true;
          "browser.sessionstore.restore_tabs_lazily" = false;
          "signon.rememberSignons" = false;
        };
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
    "lastpass-password-manager"
    "solarized-light"
  ];

  programs.home-manager.enable = true;
  home.username = "allgreed";
  home.homeDirectory = "/home/allgreed";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
