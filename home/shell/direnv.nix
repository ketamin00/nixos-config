{ config, pkgs, unstable, ... }:
{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      #package = unstable.direnv;
      nix-direnv = {
        enable = true;
      };
    };

  };
}
