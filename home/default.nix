{ config, pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.username = "julius";
  home.homeDirectory = "/home/julius";
  programs.home-manager.enable = true;


  home.packages = with pkgs; [
    (nerdfonts.override {fonts = [ "JetBrainsMono" "FiraCode" ];})
  ];
  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "ketamin00";
    userEmail = "julius.rantanen@hotmail.com";
  };

  imports = [
    ./desktop
    ./shell
  ];

}
