{ config, pkgs, colors, ... }:
let
  wallpaper = pkgs.copyPathToStore ./bg.png;
  wallpaper2 = pkgs.copyPathToStore ./bg2.png;
  powermenu = pkgs.copyPathToStore ./power.sh;
in
{
    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.wofi}/bin/wofi | xargs sway exec --";
  
        focus.followMouse = false;
  
        input = {
          "type:keyboard" = {"xkb_layout" = "dk";};
        };
  
        output = {
          DP-2 = {
            res = "2560x1440@143.972Hz";
  	    pos = "1440 700";
	    bg = "${wallpaper} fill";
  	  };
  	  HDMI-A-2 = {
            res = "2560x1440@144.006Hz";
  	    transform = "270";
  	    pos = "0 0";
	    bg = "${wallpaper2} fill";
  	  };
        };
  
        keybindings = let mod = config.wayland.windowManager.sway.config.modifier;
                          inherit menu;
   		      in {
                        "${mod}+Space" = "exec ${menu}";
  		        "${mod}+Return" = "exec ${terminal}";
			"${mod}+p" = "exec ${powermenu}";
  		        "${mod}+q" = "kill";
  		        "${mod}+Shift+q" = "kill";
  
                        "${mod}+Shift+c" = "reload";
                        "${mod}+Shift+r" = "restart";
  
                        "${mod}+Left" = "focus left";
                        "${mod}+Down" = "focus down";
                        "${mod}+Up" = "focus up";
                        "${mod}+Right" = "focus right";
  
  
                        "${mod}+Shift+Left" = "move left";
                        "${mod}+Shift+Down" = "move down";
                        "${mod}+Shift+Up" = "move up";
                        "${mod}+Shift+Right" = "move right";
  
  
                        "${mod}+1" = "workspace number 1";
                        "${mod}+2" = "workspace number 2";
                        "${mod}+3" = "workspace number 3";
                        "${mod}+4" = "workspace number 4";
                        "${mod}+5" = "workspace number 5";
                        "${mod}+6" = "workspace number 6";
                        "${mod}+7" = "workspace number 7";
                        "${mod}+8" = "workspace number 8";
                        "${mod}+9" = "workspace number 9";
                        "${mod}+0" = "workspace number 10";
  
  
                        "${mod}+Shift+1" = "move container to workspace number 1";
                        "${mod}+Shift+2" = "move container to workspace number 2";
                        "${mod}+Shift+3" = "move container to workspace number 3";
                        "${mod}+Shift+4" = "move container to workspace number 4";
                        "${mod}+Shift+5" = "move container to workspace number 5";
                        "${mod}+Shift+6" = "move container to workspace number 6";
                        "${mod}+Shift+7" = "move container to workspace number 7";
                        "${mod}+Shift+8" = "move container to workspace number 8";
                        "${mod}+Shift+9" = "move container to workspace number 9";
                        "${mod}+Shift+0" = "move container to workspace number 10";
  
  
  		        "${mod}+BackSpace" = "split toggle";
                        "${mod}+f" = "fullscreen toggle";
                        "${mod}+plus" = "floating toggle";
                        "${mod}+Shift+minus" = "move scratchpad";
                        "${mod}+minus" = "scratchpad show";
  
  		        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 4%+";
  		        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 4%-";
  		        "XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  		      };
  
        gaps = {
          smartGaps = true;
          smartBorders = "on";
          inner = 8;
          outer = 5;
        };

        bars = [ { command = "waybar"; } ]; 

        colors = {
          focused = {
            border = color.green;
            background = color.green;
            text = color.gray;
            indicator = color.purple;
            childBorder = color.green;
         };
          focusedInactive = {
            border = color.gray;
            background = color.gray;
            text = color.yellow;
            indicator = color.purple;
            childBorder = color.gray;
          };
          unfocused = {
            border = color.gray;
            background = color.gray;
            text = color.yellow;
            indicator = color.purple;
            childBorder = color.gray;
          };
          urgent = {
            border = color.red;
            background = color.red;
            text = color.fg;
            indicator = color.red;
            childBorder = color.red;
          };
        };
  
        workspaceOutputAssign = [
  	  { output = "DP-2"; workspace = "2"; }
  	  { output = "HDMI-A-2"; workspace = "1"; }
        ];
  
      };
      extraConfig = ''
        default_border pixel 2
        default_floating_border pixel 2
      '';
      extraOptions = [ "--unsupported-gpu" ];
      wrapperFeatures.gtk = true;
  
  
    };
}
