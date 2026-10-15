{
  description = "Xaiya's neovim configuration";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  };

  outputs = inputs@{
    nixpkgs,
    ...
  }:
  let
    inherit (nixpkgs) lib;

    forAllSystems =
      f:
        lib.genAttrs lib.systems.flakeExposed (
          system:
            f ( import nixpkgs { 
              inherit system; config.allowUnfree = true; 
            })
        );
  in
  {
    packages = forAllSystems (pkgs: {
      default = pkgs.callPackage ./default.nix { };
    });

    legacyPackages = forAllSystems (pkgs: {
      default = pkgs.callPackage ./default.nix { };
    });
  };
}
