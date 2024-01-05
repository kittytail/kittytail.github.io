{
  description = "Kittytail website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    theme.url = "github:kittytail/kittytail.github.io/theme/type-on-strap";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } ({ lib, ... }: {
      systems =
        let
          platforms = lib.cartesianProductOfSets {
            os = [ "darwin" "linux" ];
            arch = [ "aarch64" "x86_64" ];
          };
        in
        map (p: p.arch + "-" + p.os) platforms;

      perSystem = { pkgs, inputs', ... }:
        let
          inherit (inputs'.theme.packages) gems;
        in
        {
          packages.default = pkgs.stdenv.mkDerivation {
            name = "kittytail-website";
            src = ./.;
            nativeBuildInputs = [ gems ];
            buildPhase = ''
              JEKYLL_ENV=production jekyll build -d $out
            '';
            dontInstall = true;
          };

          apps.default.program = "${pkgs.writers.writeBash "serve" ''
            ${gems}/bin/jekyll serve "$@"
          ''}";
        };
    });
}
