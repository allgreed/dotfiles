[ {
  meta = {
    available = true;
    branch = "1.12";
    description = "The Go Programming language";
    homepage = "http://golang.org/";
    license = {
      fullName = "BSD 3-clause \"New\" or \"Revised\" License";
      shortName = "bsd3";
      spdxId = "BSD-3-Clause";
      url = "http://spdx.org/licenses/BSD-3-Clause.html";
    };
    maintainers = [ {
      email = "charles@cstrahan.com";
      github = "cstrahan";
      name = "Charles Strahan";
    } {
      email = "orivej@gmx.fr";
      github = "orivej";
      name = "Orivej Desh";
    } {
      email = "xaviosx@gmail.com";
      github = "velovix";
      name = "Tyler Compton";
    } {
      email = "joerg@thalheim.io";
      github = "mic92";
      keys = [ {
        fingerprint = "3DEE 1C55 6E1C 3DC5 54F5  875A 003F 2096 411B 5F92";
        longkeyid = "rsa4096/0x003F2096411B5F92";
      } ];
      name = "Jörg Thalheim";
    } ];
    name = "go-1.12.1";
    outputsToInstall = [ "out" ];
    platforms = [ {
      kernel = {
        _type = "kernel";
        execFormat = {
          _type = "exec-format";
          name = "elf";
        };
        families = {};
        name = "linux";
      };
    } {
      kernel = {
        families = {
          darwin = {
            _type = "exec-format";
            name = "darwin";
          };
        };
      };
    } ];
    position = "/nix/store/7zb574bzv3n17h4pp8vilad7mm6cfjqr-nixpkgs-19.09pre180124.920d066ded1/nixpkgs/pkgs/development/compilers/go/1.12.nix:234";
  };
  name = "go-1.12.1";
  out = {
    outPath = "/nix/store/749qksf79hvn0aprcznd9bwfv550qwh3-go-1.12.1";
  };
  outPath = "/nix/store/749qksf79hvn0aprcznd9bwfv550qwh3-go-1.12.1";
  outputs = [ "out" ];
  system = "x86_64-linux";
  type = "derivation";
} {
  meta = {};
  name = "git-2.21.0";
  out = {
    outPath = "/nix/store/czm6spl5g0ig57alx06apjjg9lrc657k-git-2.21.0";
  };
  outPath = "/nix/store/czm6spl5g0ig57alx06apjjg9lrc657k-git-2.21.0";
  outputs = [ "out" ];
  system = "x86_64-linux";
  type = "derivation";
} {
  meta = {};
  name = "nix-2.2.2";
  out = {
    outPath = "/nix/store/hbhdjn5ik3byg642d1m11k3k3s0kn3py-nix-2.2.2";
  };
  outPath = "/nix/store/hbhdjn5ik3byg642d1m11k3k3s0kn3py-nix-2.2.2";
  outputs = [ "out" ];
  system = "unknown";
  type = "derivation";
} {
  meta = {
    available = true;
    description = "The Rust toolchain installer";
    homepage = "https://www.rustup.rs/";
    license = [ {
      fullName = "Apache License 2.0";
      shortName = "asl20";
      spdxId = "Apache-2.0";
      url = "http://spdx.org/licenses/Apache-2.0.html";
    } {
      fullName = "MIT License";
      shortName = "mit";
      spdxId = "MIT";
      url = "http://spdx.org/licenses/MIT.html";
    } ];
    maintainers = [ {
      email = "joerg@thalheim.io";
      github = "mic92";
      keys = [ {
        fingerprint = "3DEE 1C55 6E1C 3DC5 54F5  875A 003F 2096 411B 5F92";
        longkeyid = "rsa4096/0x003F2096411B5F92";
      } ];
      name = "Jörg Thalheim";
    } ];
    name = "rustup-1.18.2";
    outputsToInstall = [ "out" ];
    position = "/nix/store/7zb574bzv3n17h4pp8vilad7mm6cfjqr-nixpkgs-19.09pre180124.920d066ded1/nixpkgs/pkgs/development/tools/rust/rustup/default.nix:65";
  };
  name = "rustup-1.18.2";
  out = {
    outPath = "/nix/store/gigvcns8v68vizfwh4y7x1c2xrw8ag4h-rustup-1.18.2";
  };
  outPath = "/nix/store/gigvcns8v68vizfwh4y7x1c2xrw8ag4h-rustup-1.18.2";
  outputs = [ "out" ];
  system = "x86_64-linux";
  type = "derivation";
} ]
