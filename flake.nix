{
  description = "The ScieBo Desktop Client.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = import nixpkgs {};
  in
  {
    packages.sciebo-desktop = pkgs.callPackage ./sciebo-desktop.nix {};
    overlays.default = self: super: {
      sciebo-desktop = pkgs.callPackage ./sciebo-desktop.nix {};
    };
  };
}
