{
  description = "Type on Strap: A simple and responsive Jekyll theme template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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

      perSystem = { pkgs, ... }:
        let
          name = "type-on-strap";
          src = ./.;
          npmRoot = "assets";

          # Specify a Bundler environment including Type on Strap's dependencies
          # and the Type on Strap gem itself. It's used to build the Type on
          # Strap gem, and also to expose the Jekyll build environment with the
          # Type on Strap theme through this flake.
          #
          # The Type on Strap gem is included in the environment because of how
          # Bundler works. Dependencies of a gem are specified in a gemset file,
          # which is then referenced by `Gemfile`. But this also has the effect
          # of adding a gem requirement on the project where the gemspec file
          # resides. This gem requirement takes priority over all other sources,
          # so the same gem installed through other means will be ignored by
          # Bundler.
          #
          # To elaborate, take this Nix expression which specifies dependencies
          # required to build a Jekyll website using the Type on Strap gem:
          #
          #     nativeBuildInputs = with thisflake.packages.${system}; [
          #       default # the Type on Strap gem
          #       gems # the Bundler environment
          #     ];
          #
          # In this case, the Type on Strap gem from the `default` derivation
          # will be straight up ignored because the same gem from the `gems`
          # derivation takes priority.
          #
          # Reference:
          # - https://bundler.io/v2.5/man/gemfile.5.html#GEMSPEC
          gems = pkgs.bundlerEnv {
            name = "gem-env";
            inherit (pkgs) ruby;
            gemdir = src;

            # Copy files from src to avoid having an empty Type on Strap gem. 
            extraConfigPaths =
              let
                # Exclude some files to avoid copying them twice. Preexising
                # files lack write permission, so copying them again will fail.
                excludes = [ "Gemfile*" "gemset.nix" ];
                toCond = filename: "-name " + lib.escapeShellArg filename;
                cond = lib.concatMapStringsSep " -or " toCond excludes;
              in
              # The implementation of extraConfigPaths accepts bash syntax.
              [ "$(find ${src} -maxdepth 1 -not \\( ${cond} \\))" ];
          };

          inherit (pkgs.npmHooks) npmConfigHook;

          # Patch NPM dependencies when "npm rebuild" is called in
          # npmConfigHook.
          #
          # TODO: Add a hook in npmConfigHook so that it can be done without
          # resorting to hacks.
          npmPreRebuildHook = ''
            npm() {
              if [[ "$1" == rebuild ]]; then
                unset -f npm

                # likely an upstream bug
                sed -i -e 's/c++0x/c++17/g' -e 's/c++11/c++17/g' \
                  node_modules/sharp/binding.gyp

                pushd node_modules/gifsicle/vendor
                rm -rf *
                ln -s ${pkgs.gifsicle}/bin/gifsicle .
                popd

                pushd node_modules/mozjpeg/vendor
                rm -rf *
                ln -s ${pkgs.mozjpeg}/bin/cjpeg .
                popd

                pushd node_modules/optipng-bin/vendor
                rm -rf *
                ln -s ${pkgs.optipng}/bin/optipng .
                popd
              fi

              command npm "$@"
            }
          '';
        in
        {
          packages = {
            inherit gems;

            default = pkgs.buildRubyGem {
              inherit name src npmRoot;
              gemName = name;

              npmDeps = pkgs.fetchNpmDeps {
                src = "${src}/${npmRoot}";
                hash = "sha256-/tcX0Cb41q9FR21LGgQS+fht8RAKYUEkP3HpeBtKXaM=";
              };

              nativeBuildInputs = [
                gems
                pkgs.git
                npmConfigHook

                # for the sharp NPM package
                pkgs.pkg-config

                # TODO: these should be made a dependency of npmHooks
                pkgs.nodejs
                pkgs.nodejs.python

              ] ++ lib.optionals pkgs.stdenv.isDarwin [
                # for node-gyp
                pkgs.darwin.cctools
              ];

              buildInputs = [
                # for the sharp NPM package
                pkgs.glib
                pkgs.vips
              ];

              prePatch = npmPreRebuildHook;

              preBuild = ''
                pushd assets
                node_modules/.bin/gulp default
                popd
              '';

              shellHook = ''
                (
                  ${npmPreRebuildHook}
                  source ${npmConfigHook}/nix-support/setup-hook
                  npmConfigHook
                )
              '';
            };

            demo = pkgs.stdenv.mkDerivation {
              name = "type-on-strap-demo";
              src = ./.;
              nativeBuildInputs = [ gems ];
              buildPhase = ''
                JEKYLL_ENV=production jekyll build -d $out
              '';
              dontInstall = true;
            };
          };

          apps = {
            default.program = "${pkgs.writers.writeBash "serve" ''
              ${gems}/bin/jekyll serve "$@"
            ''}";

            update.program = "${pkgs.writers.writeBash "update" ''
              BUNDLE_FORCE_RUBY_PLATFORM=true ${pkgs.bundix}/bin/bundix --lock
            ''}";
          };
        };
    });
}
