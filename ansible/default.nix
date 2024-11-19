let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "76612b17c0ce71689921ca12d9ffdc9c23ce40b2"; # 13-11-2024
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
