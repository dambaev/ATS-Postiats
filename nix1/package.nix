/*
Build ATS2 from the LOCAL repo sources (not the SourceForge 0.4.2 tarball
that nixpkgs fetches). Modeled on nixpkgs pkgs/by-name/at/ats2/package.nix
(copied for reference at TEST/src/test-type-inferrence/third-party/nixpkgs-ats2-package.nix)
and on the repo's own nix/tarball.nix + Makefile_devl.

Bootstrap note: the CODEGEN/DOCUGEN steps regenerate .atxt files via
bin/atsdoc and link -latsdoc; atsdoc/libatsdoc ship in the OLD `ats`
(anairiats2 0.2.12) package — same bootstrap input the repo's own
nix/tarball.nix uses (buildInputs = [ ... ats ]). It is a build-time
bootstrap tool, not part of the produced package.
*/
{ lib, stdenv, ats, gmp }:

let
  version =
    builtins.head (builtins.match "([^\n]*)\n?" (builtins.readFile ../VERSION));
in

stdenv.mkDerivation rec {
  pname = "ats2-local";
  inherit version;

  # local repo root (this file lives in nix1/, so ../. is the repo root);
  # cleanSourceFilter already drops .git and other VCS junk
  src = lib.cleanSourceWith {
    src = ../.;
    filter = path: type:
      lib.cleanSourceFilter path type;
  };

  buildInputs = [ gmp ];

  # bootstrap: atsdoc/libatsdoc come from the old `ats` (anairiats2) package;
  # the makefiles call $(ATSHOME)/bin/atsdoc (see codegen Makefile.gen).
  # This is the line the repo's nix/tarball.nix had (the fork commented it
  # out; without it ATSHOME is empty and the path resolves to /bin/atsdoc).
  ATSHOME = "${ats}/lib/ats-anairiats-${ats.version}";

  # ATSHOMERELOC makes atsopt emit staload symbols relative to this reloc
  # name ("ATS-0.2.12/..."), matching the symbol prefix baked into the old
  # package's libatsdoc.a (ATS_2d0_2e2_2e12_...); without it the store path
  # is encoded and -latsdoc links fail.
  ATSHOMERELOC = "ATS-${ats.version}";

  # nixpkgs notes parallel build breaks the ATS2 make graph
  # (*** No rule to make target 'patscc.dats' ***): keep it serial
  enableParallelBuilding = false;

  env.NIX_CFLAGS_COMPILE = "-Wno-error=implicit-function-declaration";

  makeFlags = [
    "CC=cc"
    "CCOMP=cc"
  ];

  # same as the repo's nix/tarball.nix configurePhase
  configurePhase = ''
    runHook preConfigure
    export PATSHOME=$PWD
    make -f codegen/Makefile_atslib
    runHook postConfigure
  '';

  # canonical dev build: patsopt + patscc + myatscc + libatsopt + atslib
  buildPhase = ''
    runHook preBuild
    make -f Makefile_devl all
    runHook postBuild
  '';

  # mirror the packaged tree layout used by doc/DISTRIB (what the
  # SourceForge tarball contains): bin + share ccomp prelude libats contrib
  installPhase = ''
    runHook preInstall
    libdir=$out/lib/ats2-postiats-$version
    mkdir -p $libdir
    for x in bin share ccomp prelude libats contrib; do
      [ -e $x ] && cp -r $x $libdir/
    done
    for f in AUTHORS COPYING INSTALL VERSION CHANGES-ats2 CHANGES-contrib README README.md; do
      [ -e $f ] && cp $f $libdir/
    done
    runHook postInstall
  '';

  # nixpkgs setup-hook.sh equivalent (see third-party/nixpkgs-ats2-setup-hook.sh)
  setupHook = builtins.toFile "setup-hook.sh" ''
    export PATSHOME=@out@/lib/ats2-postiats-@version@
  '';

  meta = {
    description = "ATS2/Postiats compiler built from local repo sources";
    homepage = "http://www.ats-lang.org";
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.unix;
  };
}
