{
  inputs = {
    nixpkgs.url = "nixpkgs/release-23.05";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # select and add our lua packages
        lua = pkgs.lua5_3.override {
          packageOverrides = (luafinal: (luaprev:
            let callPackage = luafinal.callPackage; in
            {
              internationalize = callPackage ./nix/internationalize.nix { };
              lacord = callPackage ./nix/lacord.nix { };
              luatweetnacl = callPackage ./nix/luatweetnacl.nix { };
              shs = callPackage ./nix/shs.nix { };
            }
          ));
        };
      in
      {
        packages.default = lua.pkgs.lacord;
      });
}
