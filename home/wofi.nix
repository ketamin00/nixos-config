{ config, pkgs, ...}:
let theme = import ./colors.nix;
in
{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 800;
      height = 800;
      term = "${pkgs.alacritty}/bin/alacritty";
      prompt = "";
    };
    style = ''
      * {
          font-family: JetBrainsMono Nerd Font;
      }
      window {
	margin: 0px;
	border: 1px solid ${theme.blue};
	background-color: ${theme.bg};
	}

	#input {
	margin: 5px;
	border: none;
	color: ${theme.fg};
	background-color: ${theme.bg0_h};
	}

	#inner-box {
	margin: 5px;
	border: none;
	background-color: ${theme.bg};
	}

	#outer-box {
	margin: 5px;
	border: none;
	background-color: ${theme.bg};
	}

	#scroll {
	margin: 0px;
	border: none;
	}

	#text {
	margin: 5px;
	border: none;
	color: ${theme.fg};
	}

	#entry:selected {
	background-color: ${theme.bg0_h};
	}
    '';
  };
}