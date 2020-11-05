{ mkDerivation, aeson, base, stdenv, text }:
mkDerivation {
  pname = "haskeleton";
  version = "0.1.0.0";
  src = ./..;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ aeson base text ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
