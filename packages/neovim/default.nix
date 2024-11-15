{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "neovim";
  version = "0.10.2";

  src = pkgs.fetchurl {
    url = "https://github.com/neovim/neovim/releases/download/v${version}/nvim-linux64.tar.gz";
    sha256 = "05sjw4200ggwk8vp3x4b527sf4pmphi8ms3q9r788fshbminwscz";
  };

  nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.makeWrapper ];
  buildInputs = [ pkgs.zlib ];

  unpackPhase = ''
    tar xzvf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r nvim-linux64/* $out/
  '';

  postFixup = ''
    wrapProgram $out/bin/nvim --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.zlib ]}
  '';

  meta = with pkgs.lib; {
    description = "Vim-fork focused on extensibility and usability";
    homepage = "https://neovim.io/";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}