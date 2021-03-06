{ ctags, fetchurl, lib, libressl, man, ncurses, pkg-config, stdenv }:

stdenv.mkDerivation rec {
  pname = "catgirl";
  version = "1.8";

  src = fetchurl {
    url = "https://git.causal.agency/catgirl/snapshot/${pname}-${version}.tar.gz";
    sha256 = "0svpd2nqsr55ac98vczyhihs6pvgw7chspf6bdlwl98gch39dxif";
  };

  nativeBuildInputs = [ ctags pkg-config ];
  buildInputs = [ libressl man ncurses ];
  strictDeps = true;

  meta = with lib; {
    homepage = "https://git.causal.agency/catgirl/about/";
    license = licenses.gpl3Plus;
    description = "A TLS-only terminal IRC client";
    platforms = platforms.unix;
    maintainers = with maintainers; [ xfnw ];
  };
}
