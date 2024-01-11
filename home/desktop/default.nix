{pkgs, ...}: {
  home.packages = with pkgs; [
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

    libnotify
  ];
  programs.firefox.enable = true;

  imports = [
    ./gtk.nix
    ./sway.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
    ./vscode.nix
    ./fonts.nix
    ./mako.nix
  ];
}
