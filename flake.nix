{
  description = "A tiny CMake module collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    {
      lib = import ./. { inherit nixpkgs; };
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = import ./. { inherit nixpkgs; };
      in rec {
        packages = flake-utils.lib.flattenTree {
          tinycmmc = pkgs.stdenv.mkDerivation {
            pname = "tinycmmc";
            version = lib.versionFromFile self;
            src = nixpkgs.lib.cleanSource ./.;
            nativeBuildInputs = [
              pkgs.cmake
            ];
          };
        };
        defaultPackage = packages.tinycmmc;
      }
    );
}
