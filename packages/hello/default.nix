{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "hello";
  version = "2.12.1";
  src = pkgs.fetchurl {
    url = "mirror://gnu/hello/hello-2.12.1.tar.gz";
    sha256 = "jZkUKv2SV28wsM18tCqNxoCZmLxdYH2Idh9RLibH2yA=";
  };
  doCheck = true;
  meta = with pkgs.lib; {
    description = "A program that produces a familiar, friendly greeting";
    homepage = "https://www.gnu.org/software/hello/";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
