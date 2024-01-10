{
  config,
  pkgs,
  colors,
  ...
}: let
in {
  home.packages = with pkgs; [
    alacritty
  ];

  programs = {
    alacritty = {
      enable = true;
      settings = {
        font.normal.family = "JetBrainsMono Nerd Font";
        font.size = 14;
        colors = {
          primary = {
            background = colors.bg;
            foreground = colors.fg;
          };
          normal = {
            black = colors.bg0_h;
            red = colors.red;
            green = colors.green;
            yellow = colors.yellow;
            blue = colors.blue;
            magenta = colors.purple;
            cyan = colors.aqua;
            white = colors.fg2;
          };
          bright = {
            black = colors.bg0_s;
            red = colors.red2;
            green = colors.green2;
            yellow = colors.yellow2;
            blue = colors.blue2;
            magenta = colors.purple2;
            cyan = colors.aqua2;
            white = colors.fg0;
          };
        };
      };
    };
  };
}
