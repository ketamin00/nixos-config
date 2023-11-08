{ config, pkgs, ...}:
let
  theme = import ./colors.nix;
in
{
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
            background = theme.bg;
	    foreground = theme.fg;
	  };
	  normal = {
            black = theme.bg0_h;
	    red = theme.red;
	    green = theme.green;
	    yellow = theme.yellow;
	    blue = theme.blue;
	    magenta = theme.purple;
	    cyan = theme.aqua;
	    white = theme.fg2;
	  };
	  bright = {
            black = theme.bg0_s;
	    red = theme.red2;
	    green = theme.green2;
	    yellow = theme.yellow2;
	    blue = theme.blue2;
	    magenta = theme.purple2;
	    cyan = theme.aqua2;
	    white = theme.fg0;
	  };
	};
      };
    };
  };
}
