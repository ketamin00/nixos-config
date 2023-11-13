{config, pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.username = "julius";
  home.homeDirectory = "/home/julius";
  programs.home-manager.enable = true;

  imports = [
    ./desktop
    ./shell
  ];

}
