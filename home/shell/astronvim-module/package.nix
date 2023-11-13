{ stdenv, pkgs, astronvim, ...}:

stdenv.mkDerivation {
  name = "astronvim";
  src = astronvim;
  buildInputs = [ pkgs.neovim ];

  installPhase = ''
    nvim --headless -c 'quitall'
    mv AstroNvim/* $out
  '';

}

