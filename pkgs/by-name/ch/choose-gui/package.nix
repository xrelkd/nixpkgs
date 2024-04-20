{ lib
, stdenv
, darwin
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "choose-gui";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "chipsenkbeil";
    repo = "choose";
    rev = version;
    hash = "sha256-oR0GgMinKcBHaZWdE7O+mdbiLKKjkweECKbi80bjW+c=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  meta = with lib; {
    description = "Fuzzy matcher for OS X that uses both std{in,out} and a native GUI";
    homepage = "https://github.com/chipsenkbeil/choose";
    changelog = "https://github.com/chipsenkbeil/choose/blob/${src.rev}/CHANGELOG.md";
    platforms = platforms.darwin;
    license = licenses.mit;
    maintainers = with maintainers; [ xrelkd ];
    mainProgram = "choose-gui";
  };
}
