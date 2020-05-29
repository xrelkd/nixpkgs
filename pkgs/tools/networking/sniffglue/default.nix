{ lib, fetchFromGitHub, rustPlatform, libpcap, libseccomp, pkgconfig }:

rustPlatform.buildRustPackage rec {
  pname = "sniffglue";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "kpcyrd";
    repo = pname;
    rev = "v${version}";
    sha256 = "1v01k5s2m7d8mi36dyjlbc8x76n9wnrfqi0q3nbgzvh6rimnz8lv";
  };

  cargoSha256 = "0q1ch0a3q8rl8yacrmbmfcmy89y9pqxiw0kh4dd4d2f7wg8985l5";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ libpcap libseccomp ];

  meta = with lib; {
    description = "Secure multithreaded packet sniffer";
    homepage = "https://github.com/kpcyrd/sniffglue";
    license = licenses.gpl3;
    maintainers = with maintainers; [ xrelkd ];
    platforms = platforms.linux;
  };
}
