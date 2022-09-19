{
  description = "Kittytail website";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ruby = pkgs.ruby.withPackages (ps: with ps; [
          jekyll
          jekyll-paginate
          jekyll-feed
          jekyll-sass-converter
          jekyll-seo-tag
          kramdown
          kramdown-parser-gfm
          mercenary
          rb-fsevent
          rouge
          sassc
          terminal-table
          unicode-display_width
        ]);
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "kittytail-website";
          src = ./.;
          nativeBuildInputs = [ pkgs.git ruby ];
          buildPhase = ''
            jekyll build -d $out
          '';
          dontInstall = true;
        };
      });
}
