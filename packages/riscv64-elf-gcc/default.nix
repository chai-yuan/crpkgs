{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "riscv64-elf-gcc";
  version = "2024.12.16";

  src = pkgs.fetchurl {
    url = "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${version}/riscv64-elf-ubuntu-24.04-gcc-nightly-${version}-nightly.tar.xz";
    sha256 = "18mvq8101r3vh0msljhl6c6i94lsmv8vwl6lbm8jq0wqpk5jz1kv";  
  };

  unpackPhase = ''
    tar xf $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r riscv/* $out/
  '';

  postFixup = ''
    find $out/bin -type f -executable -exec patchelf --set-rpath ${pkgs.glibc}/lib:${pkgs.zlib}/lib {} \;
  '';

  meta = with pkgs.lib; {
    description = "RISC-V GNU Toolchain (precompiled)";
    homepage = "https://github.com/riscv-collab/riscv-gnu-toolchain";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}