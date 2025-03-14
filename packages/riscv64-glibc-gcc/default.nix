{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "riscv64-glibc-gcc";
  version = "2024.05-1";

  src = pkgs.fetchurl {
    url = "https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2024.05-1.tar.xz";
    sha256 = "78e16f3def8b2ff3da09c16155f993ac7e4dc1791d0904ada03fcb2e04910aab";
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
