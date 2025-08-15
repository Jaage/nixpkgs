{
  pkgs ? import <nixpkgs> { },
  # base-devel,
  cmake,
  cmark-gfm,
  fetchFromGitHub,
  # layer-shell-qt,
  libsForQt5,
  libqalculate,
  minizip,
  ninja,
  nodejs,
  # npm,
  protobuf,
  # qtbase,
  # qtkeychain,
  # qtsvg,
  rapidfuzz-cpp,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vicinae";
  version = "0.0.5";
  npm = pkgs.callPackage (./pkgs/npm) { };
  # layer-shell-qt = pkgs.callPackage (./pkgs/layer-shell-qt) { };
  layer-shell-qt = libsForQt5.layer-shell-qt;
  # qtbase = pkgs.callPackage (./pkgs/qtbase) { };
  qtbase = libsForQt5.qt5.qtbase;
  # qtkeychain = pkgs.callPackage (./pkgs/qtkeychain) { };
  qtkeychain = libsForQt5.qtkeychain;
  # qtsvg = pkgs.callPackage (./pkgs/qtsvg) { };
  qtsvg = libsForQt5.qt5.qtsvg;

  src = fetchFromGitHub {
    owner = "vicinaehq";
    repo = "${finalAttrs.pname}";
    rev = "23d5993dfed33af2f05cb87188130334c73c9524";
    hash = "sha256-BKofThX8ZZyBPDTsLL167KHHWLUxeoUjXxmhT9obQI4=";
  };

  nativeBuildInputs = [
    # base-devel
    cmake
    cmark-gfm
    "${finalAttrs.layer-shell-qt}"
    libqalculate
    minizip
    ninja
    nodejs
    "${finalAttrs.npm}"
    protobuf
    "${finalAttrs.qtbase}"
    "${finalAttrs.qtkeychain}"
    "${finalAttrs.qtsvg}"
    rapidfuzz-cpp
  ];

  buildInputs = [
    cmark-gfm
    "${finalAttrs.layer-shell-qt}"
    libqalculate
    minizip
    nodejs
    protobuf
    "${finalAttrs.qtbase}"
    "${finalAttrs.qtkeychain}"
    "${finalAttrs.qtsvg}"
  ];
})
