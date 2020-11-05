# Skeleton Haskell Flake

included is my attempt at a bare bones haskell project, implemented as a nix flake in order to allow reproducible builds.

## building

allows usage within `nix shell`, assuming a flakes system, with the followng:

```
nix shell github:techieAgnostic/haskeleton#haskeleton
```

otherwise it can be built normally with:

```
nix build.
```

or added to a system configuration by creating an input:

```
inputs.haskeleton.url = "github:techieAgnostic/haskeleton";
```

and using the `haskeleton.overlay` attribute to import the program into your pkgset.

## adding hackage dependencies

dependencies can be added to the `haskeleton.cabal` file as normal. the `haskeleton.nix` file must be regenerated once this happens.

> !!!important!!!

in order for this to work without manual editing of `haskeleton.nix`, the command must be run from the `./nix` directory.

```
cd ./nix
cabal2nix ../ > haskeleton.nix
```

for packages not in the nixpkgs repository, or that you would like to have a different version of than appears in the repo, you can add them to the `./nix` directory manually like so:

```
cabal2nix cabal://name-version > ./nix/name.nix
```

and in order to disable building tests, documentation, or to jailbreak the dependencies of a package (should the build fail for those reasons), add the packages name to the lists defined in `./release.nix`.
