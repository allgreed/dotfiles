let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "5e4fbfb6b3de1aa2872b76d49fafc942626e2add"; # 18-11-2024 
    # obtain via `git ls-remote https://github.com/nixos/nixpkgs nixos-unstable`
  }) { config = {}; };

  pythonCore = pkgs.python3;
  pythonPkgs = python-packages: with python-packages; [
      setuptools
    ]; 
  myPython = pythonCore.withPackages pythonPkgs;
in
pkgs.mkShell {
  buildInputs = with pkgs;
    [
      git
      ansible
      myPython
      dotfiles
      gnumake
    ];
}
