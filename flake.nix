{
  description = "The ScieBo Desktop Client.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.default = self.packages.${system}.sciebo-desktop;
      packages.sciebo-desktop = pkgs.callPackage ./sciebo-desktop.nix {};
    }
  ) // {
    overlays.default = final: prev: {
      inherit (self.packages.${prev.system}) sciebo-desktop;
    };
  };
}
