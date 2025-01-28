{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "riscv32-elf-gcc";
  version = "2025.01.20";

  src = pkgs.fetchurl {
    url = "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${version}/riscv32-elf-ubuntu-22.04-gcc-nightly-${version}-nightly.tar.xz";
    sha256 = "1k1a2q5ci3940gqc1pjvpxn48wnnqp8nbliahs5nhfn0byc0xk2z";
  };

  unpackPhase = ''
    tar xf $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r riscv/* $out/
  '';

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.glibc}/lib:${pkgs.zlib}/lib:$LD_LIBRARY_PATH
  '';

  meta = with pkgs.lib; {
    description = "RISC-V GNU Toolchain (precompiled) for 32-bit targets";
    homepage = "https://github.com/riscv-collab/riscv-gnu-toolchain";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}