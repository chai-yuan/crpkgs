{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "riscv64-elf-gcc";
  version = "2024.12.16";

  src = pkgs.fetchurl {
    url = "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${version}/riscv64-elf-ubuntu-22.04-gcc-nightly-${version}-nightly.tar.xz";
    sha256 = "0cj000sis87x8hxzj4zq2swrhdf1s857a2gfa937rlwrc98jphqp";  
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
    description = "RISC-V GNU Toolchain (precompiled)";
    homepage = "https://github.com/riscv-collab/riscv-gnu-toolchain";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}