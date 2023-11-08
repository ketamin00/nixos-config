{ config, pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.username = "julius";
  home.homeDirectory = "/home/julius";
  programs.home-manager.enable = true;


  home.packages = with pkgs; [
    firefox
    neofetch
    wl-clipboard
    xdg-utils
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
    grim
    slurp
    pavucontrol
    blueman
    swaybg

    shared-mime-info
    lxmenu-data


    signal-desktop
    pcmanfm

    spotify
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
