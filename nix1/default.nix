/*
Entry point: nix-build nix1  (or: nix-build nix1/default.nix)
Pins nixpkgs like the repo's flake does, so the build is reproducible
across nixpkgs revisions.
*/
let
  # same pinned nixos-24.05 commit the repo's flake.nix uses
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/8f7492cce28977fbf8bd12c72af08b1f6c7c3e49.tar.gz";
  pkgs = import nixpkgs {};
in
pkgs.callPackage ./package.nix { }
