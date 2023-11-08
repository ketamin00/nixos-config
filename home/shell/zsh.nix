{ config, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
    #initExtra = "eval \"\$(${pkgs.direnv}/bin/direnv hook zsh)\"";
  };

}
