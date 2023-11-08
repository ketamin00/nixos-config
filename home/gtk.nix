{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };
    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Gruvbox-Dark";
    };
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Gruvbox-Dark";
    size = 22;
    x11 = {
      enable = true;
      defaultCursor = "Simp1e-Gruvbox-Dark";
    };
  };
}