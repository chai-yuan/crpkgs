{
  description = "My custom Nix packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          crpkgs = import ./packages { inherit pkgs; };
        in
        crpkgs
      );

      defaultPackage = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          crpkgs = import ./packages { inherit pkgs; };
        in
        crpkgs.hello
      );

      templates = import ./templates;
    };
}
