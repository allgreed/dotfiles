with import <nixpkgs> {};
let
  pythonCore = python38;
  pythonPkgs = python-packages: with python-packages; [
      setuptools
    ]; 
  myPython = pythonCore.withPackages pythonPkgs;
in
mkShell {
  buildInputs = 
    [
      git
      ansible
      myPython
      dotfiles
      gnumake
    ];
}
