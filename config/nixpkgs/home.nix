{ config, pkgs, ... }:
let
  # TODO: pin it better
  nur = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
    sha256 = "01k2i1wmwv800j0v533p9rclv3cgnjqm2pb18h61s0cjkc271yy6";
    }){
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
      videospeed
      polish-dictionary
      news-feed-eradicator
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
    enable = true;
    cpuCountFromZero = true;
    showCpuUsage = true;
    colorScheme = 6;
    highlightBaseName = true;
    vimMode = true;
  };

  systemd.user.services = {
    lmap-forever = {
      Unit = {
        Description = "lmap-forever";
        Documentation = [
          "https://github.com/allgreed/lmap-forever"
          "https://github.com/allgreed/lmap"
        ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        TimeoutStartSec = 0;
        Restart = "always";
        ExecStartPre="/bin/sh -c 'export PATH=/run/current-system/sw/bin/:/usr/bin/; docker stop lmap-forever && (docker rm lmap-forever || true) || true'";
        ExecStart="/bin/sh -c 'export PATH=/run/current-system/sw/bin/:/usr/bin/; docker run -e STORAGE_PROVIDER_TYPE=file -e STORAGE_PROVIDER_FILE_PATH=/data -v /home/allgreed/lmap:/data --rm --name lmap-forever -p 12694:12694 allgreed/lmap-forever:preview0'";
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
