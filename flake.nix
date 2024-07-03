{
  description = "The ScieBo Desktop Client.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system: 
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.sciebo-desktop = pkgs.callPackage ./sciebo-desktop.nix {};
      overlays.default = self: super: {
        sciebo-desktop = pkgs.callPackage ./sciebo-desktop.nix {};
      };
    }
  );
}
