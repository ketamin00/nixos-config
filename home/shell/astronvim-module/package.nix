{ stdenv, pkgs, astronvim, ...}:

stdenv.mkDerivation {
  name = "astronvim";
  src = astronvim;
  buildInputs = [ pkgs.neovim ];

  
  installPhase = ''
    export XDG_CONFIG_HOME=$TMPDIR
    cp -r $src $XDG_CONFIG_HOME/nvim/
    nvim --headless -c 'quitall'
    cp -r $XDG_CONFIG_HOME/nvim/ $out
  '';

}

