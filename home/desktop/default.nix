{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    signal-desktop
    spotify

    blueman
    pavucontrol

    pcmanfm
    lxmenu-data
    shared-mime-info


    xdg-utils
    grim
    slurp

    openrgb-with-all-plugins

  ];

  imports = [
    ./gtk.nix
    ./sway.nix
    ./waybar.nix
    ./wofi.nix
    ./vscode.nix
    ./fonts.nix
  ];

}
