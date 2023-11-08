{ config, pkgs, colors, ...}:
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
	border: 1px solid ${colors.blue};
	background-color: ${colors.bg};
	}

	#input {
	margin: 5px;
	border: none;
	color: ${colors.fg};
	background-color: ${colors.bg0_h};
	}

	#inner-box {
	margin: 5px;
	border: none;
	background-color: ${colors.bg};
	}

	#outer-box {
	margin: 5px;
	border: none;
	background-color: ${colors.bg};
	}

	#scroll {
	margin: 0px;
	border: none;
	}

	#text {
	margin: 5px;
	border: none;
	color: ${colors.fg};
	}

	#entry:selected {
	background-color: ${colors.bg0_h};
	}
    '';
  };
}
