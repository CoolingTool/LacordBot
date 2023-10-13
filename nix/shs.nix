{ lua
, cqueues
, http
, lua-zlib
, buildLuarocksPackage
, fetchFromGitHub
}:
buildLuarocksPackage {
  pname = "shs";
  version = "20220221";

  src = fetchFromGitHub {
    owner = "Mehgugs";
    repo = "shs";
    rev = "0fe073b7dd86834b85e3103ab984ee4d6b333f8a";
    sha256 = "sha256-HhQeT9e5vpqwRBMYR6hZEt09xSoimWiGMIanTKAmNF4=";
  };

  knownRockspec = "shs-dev-0.rockspec";

  propagatedBuildInputs = [
    lua
    cqueues
    http
    lua-zlib
  ];
}
