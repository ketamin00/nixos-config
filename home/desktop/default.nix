{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    signal-desktop
    spotify

    blueman
    pavucontrol

    pcmanfm
    gnome.file-roller
    lxmenu-data
    shared-mime-info


    xdg-utils
    grim
    slurp


  ];

  imports = [
    ./gtk.nix
    ./sway.nix
    ./waybar.nix
    ./wofi.nix
    ./vscode.nix
    ./fonts.nix
    ./mako.nix
  ];

}
