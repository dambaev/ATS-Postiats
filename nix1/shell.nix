/*
Interactive shell for building the LOCAL sources:
  nix-shell nix1/shell.nix
then run:  make -f Makefile_devl all
(the derivation's phases do NOT run in nix-shell; PATSHOME/PATH are set
here so the freshly built bin/patscc works in-tree, like nix/path_hack.sh)
*/
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/8f7492cce28977fbf8bd12c72af08b1f6c7c3e49.tar.gz";
  pkgs = import nixpkgs {};
in
(pkgs.callPackage ./package.nix {}).overrideDerivation (drv: {
  shellHook = ''
    export PATSHOME=$PWD
    export PATH=$PATH:$PWD/bin
    echo "ATS2 local dev shell. Build with: make -f Makefile_devl all"
    echo "PATSHOME=$PATSHOME"
  '';
})
