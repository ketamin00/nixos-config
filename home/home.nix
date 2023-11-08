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

    gruvbox-gtk-theme
    simp1e-cursors
    gruvbox-dark-icons-gtk

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
    ./sway.nix
    ./wofi.nix
    ./waybar.nix
    ./gtk.nix
    ./vscode.nix
    ./playerctl.nix
    ./terminal
  ];

}
