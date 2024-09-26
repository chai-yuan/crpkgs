{ pkgs }:

{
  hello = import ./hello { inherit pkgs; };
}
