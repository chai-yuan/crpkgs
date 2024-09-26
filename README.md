# My Nix Packages Repository

This repository contains a collection of custom Nix packages that I have created. These packages can be easily integrated into your Nix projects or NixOS configurations.

## Usage

To use these packages in your Nix projects, you can add this repository as an input to your `flake.nix` file. Here is an example:

```nix
{
  description = "My project using custom packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    crpkgs.url = "github:chai-yuan/crpkgs";
  };

  outputs = { self, nixpkgs, crpkgs }:
    let
      system = "x86_64-linux";  # or your system
      pkgs = import nixpkgs { inherit system; };
      crPkgs = crpkgs.packages.${system};
    in
    {
      packages.${system} = {
        my-custom-package = crPkgs.hello;
      };

      defaultPackage.${system} = crPkgs.hello;
    };
}
```
