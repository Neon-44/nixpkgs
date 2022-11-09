{ lib, stdenv, fetchFromGitHub, cmake }:
stdenv.mkDerivation rec {
  pname = "entt";
  version = "3.11.0";

  src = fetchFromGitHub {
    owner = "skypjack";
    repo = "entt";
    rev = "v${version}";
    sha256 = "sha256-urB1oU4Riuo9+DKmMf317bqF4hTcm/zsSLn5fpZY27o=";
  };

  nativeBuildInputs = [ cmake ];

  # https://github.com/skypjack/entt/issues/890
  postPatch = ''
    substituteInPlace cmake/in/entt.pc.in \
      --replace '$'{prefix}/@CMAKE_INSTALL_INCLUDEDIR@ @CMAKE_INSTALL_FULL_INCLUDEDIR@
  '';

  meta = with lib; {
    homepage = "https://github.com/skypjack/entt";
    description = "A header-only, tiny and easy to use library for game programming and much more written in modern C++";
    maintainers = with maintainers; [ twey ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
