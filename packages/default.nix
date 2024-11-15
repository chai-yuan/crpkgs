{ pkgs }:

{
  hello = import ./hello { inherit pkgs; };
  neovim = import ./neovim { inherit pkgs; };
}
