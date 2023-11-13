{ stdenv, astronvim, ...}:

stdenv.mkDerivation {
  name = "astronvim";
  src = astronvim;

  installPhase = ''
    nvim --headless -c 'quitall'
  '';

}

