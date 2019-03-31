{ stdenv, coreutils, makeWrapper, lib, fetchFromGitHub, glibcLocales
, seth, curl, jshon, bc, gnused, which, perl, datamash }:

stdenv.mkDerivation rec {
  name = "setzer-${version}";
  version = "0.2.1";
  src = ./.;

  nativeBuildInputs = [makeWrapper];
  buildPhase = "true";
  makeFlags = ["prefix=$(out)"];
  postInstall = let path = lib.makeBinPath [
    coreutils seth curl jshon bc gnused which perl datamash
  ]; in ''
    wrapProgram "$out/bin/setzer" --prefix PATH : "${path}" \
      ${if glibcLocales != null then
        "--set LOCALE_ARCHIVE \"${glibcLocales}\"/lib/locale/locale-archive"
        else ""}
  '';

  meta = with lib; {
    description = "Ethereum price feed tool";
    homepage = https://github.com/makerdao/setzer;
    license = licenses.gpl3;
    inherit version;
  };
}
