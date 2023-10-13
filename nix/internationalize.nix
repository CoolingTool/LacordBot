{ lua
, stdenv
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  pname = "internationalize";
  version = "20220823";

  src = fetchFromGitHub {
    owner = "Mehgugs";
    repo = "internationalize";
    rev = "22569e201d032cc2969f399dfc7b64b479199a88";
    sha256 = "sha256-PJsUXvk4lrjHxn5NtnO9PvUu4CaNWj++7abdiUEpKSo=";
  };

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r internationalize $out/lib/lua/${lua.luaversion}/
  '';
}
