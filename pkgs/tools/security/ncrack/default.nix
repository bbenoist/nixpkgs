{ stdenv, fetchurl, openssl, zlib }:

stdenv.mkDerivation rec {
  name = "ncrack-0.4ALPHA";

  src = fetchurl {
    url = "http://nmap.org/ncrack/dist/${name}.tar.gz";
    sha256 = "00vnr12g77yvh3h26qwzmyp4k71bkc9my2pcch04jnc5yq77xggq";
  };
  
  buildInputs = [ openssl zlib ];

  NIX_LDFLAGS = "-lssp";

  meta = with stdenv.lib; {
    description = "High-speed network authentication cracking tool.";
    homepage = http://nmap.org/ncrack/;
    license = "GPL2+";
    maintainers = [ stdenv.lib.maintainers.bbenoist ];
    platforms = platforms.linux;
  };
}
