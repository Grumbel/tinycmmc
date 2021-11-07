{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  description = "tinycmmc flake";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        buildTools = [ pkgs.cmake pkgs.ninja ];
        inherit (nixpkgs) lib;
      in rec {
        packages = flake-utils.lib.flattenTree {
          tinycmmc = pkgs.stdenv.mkDerivation rec {
            pname = "tinycmmc";
            version = "0.1.0";
            src = lib.cleanSource ./.;
            nativeBuildInputs = buildTools;
            # setupHook = ./setup-hook.sh;
          };
        };
        defaultPackage = packages.tinycmmc;
      });
}
