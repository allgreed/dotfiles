{ config, pkgs, ... }:
let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
in
{
  programs.firefox = {
    enable = true;
    extensions = with nur.repos.rycee.firefox-addons; [
      https-everywhere
      lastpass-password-manager
      vimium
      ublock-origin
      # TODO: build them manually
      # TODO: remove ff-addons.py from setup
      #news-feed-eradicator
      #polish-spellchecker-dictionary
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

  manual.html.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "lastpass-password-manager"
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
