{ lua
, cqueues
, http
, lua-zlib
, lua-cjson
, inspect
, luatweetnacl
, shs
, internationalize
, buildLuarocksPackage
, fetchFromGitHub
}:
buildLuarocksPackage {
  pname = "lacord";
  version = "20220912";

  src = fetchFromGitHub {
    owner = "Mehgugs";
    repo = "lacord";
    rev = "c9e925fa065503fc3c90f61d5e84a0a68be34d74";
    sha256 = "sha256-hxZD7R+MJMTmDLyD6jnCmIlF/r5eHi6VUjGfU1oYF5M=";
  };

  patches = [
    ./patches/lacord-use-normal-cjson.patch
    ./patches/lacord-unsubmodulize.patch
  ];

  knownRockspec = "lacord-scm-4.rockspec";

  propagatedBuildInputs = [
    lua
    cqueues
    http
    lua-zlib
    lua-cjson
    inspect
    luatweetnacl
    shs
    internationalize
  ];
}
