{ lua
, buildLuarocksPackage
, fetchFromGitHub
}:
buildLuarocksPackage {
  pname = "luatweetnacl";
  version = "20211117";

  src = fetchFromGitHub {
    owner = "philanc";
    repo = "luatweetnacl";
    rev = "9507d35ea18b12c69bd61c4ca070805143b64243";
    sha256 = "sha256-MEKwWOLQraGOmGdinTPdNjPn45KZ65QMTh0f9nrf12E=";
  };

  knownRockspec = "luatweetnacl-0.5-1.rockspec";

  propagatedBuildInputs = [ lua ];
}
