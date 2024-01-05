# The NekoBlocker Website

This repo contains code for the NekoBlocker website.

## How to test changes locally
### Using Nix
First, make sure that Nix flakes are enabled on your system. Then run the
following command:

```sh
nix run
```

### Using Bundler
First, fetch Ruby dependencies.

```sh
bundle install
```

Then run the following command:

```sh
bundle exec jekyll serve
```
