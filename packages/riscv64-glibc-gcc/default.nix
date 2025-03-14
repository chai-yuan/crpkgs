{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "riscv64-glibc-gcc";
  version = "2024.05-1";

  src = pkgs.fetchurl {
    url = "https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2024.05-1.tar.xz";
    sha256 = "0cj000sis87x8hxzj4zq2swrhdf1s857a2gfa937rlwrc98jphqp";  
  };

  unpackPhase = ''
    tar xf $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r riscv64-lp64d--glibc--stable-2024.05-1/* $out/
  '';

  shellHook = ''
  '';

  meta = with pkgs.lib; {
    description = "RISC-V GNU Toolchain (precompiled) with glibc";
    homepage = "https://github.com/riscv-collab/riscv-gnu-toolchain";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
