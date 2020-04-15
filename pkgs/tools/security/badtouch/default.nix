{ lib, fetchFromGitHub, rustPlatform, openssl, pkgconfig }:

rustPlatform.buildRustPackage rec {
  pname = "badtouch";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "kpcyrd";
    repo = pname;
    rev = "v${version}";
    sha256 = "1n96ah4dgmhsi4x3aazjdn7qd4dvf8bh0nwwacyhakrzf69nfp08";
  };

  cargoSha256 = "0hi5g74ydhzm1sjxhd7j41fk5adz2cqisn5mxlj1vsd5l5xvg7kd";

  buildInputs = [ openssl ];

  nativeBuildInputs = [ pkgconfig ];

  meta = with lib; {
    description = "Scriptable network authentication cracker";
    homepage = "https://github.com/kpcyrd/badtouch";
    license = licenses.gpl3;
    maintainers = with maintainers; [ xrelkd ];
    platforms = platforms.linux;
  };
}
