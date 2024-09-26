{
  description = "hello-c";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default =
        pkgs.mkShell {
          name = "isolated-dev";
          buildInputs = with pkgs; [
            neovim
            gcc
          ];
          shellHook = ''
            echo "Welcome to the isolated development environment!"
          '';
        };
    };
}
