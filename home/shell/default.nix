{ config, pkgs, ...}:
{

  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./lazygit.nix
    ./zsh.nix
    ./playerctl.nix
  ];

}
