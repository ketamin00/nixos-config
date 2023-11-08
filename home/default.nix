{ config, pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.username = "julius";
  home.homeDirectory = "/home/julius";
  programs.home-manager.enable = true;


  home.packages = with pkgs; [
    neofetch
    wl-clipboard
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    dnsutils
    file
    which
    tree
    bottom
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
