{ pkgs }:

{
  hello = import ./hello { inherit pkgs; };
  neovim = import ./neovim { inherit pkgs; };
  riscv64-elf-gcc = import ./riscv64-elf-gcc { inherit pkgs; };
  riscv32-elf-gcc = import ./riscv32-elf-gcc { inherit pkgs; };
}
