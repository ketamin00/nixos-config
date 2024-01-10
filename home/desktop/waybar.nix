{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.unstable.waybar;
    settings = [
      {
        spacing = 10;
        fixed-center = true;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "memory"
          "cpu"
          "temperature"
          "sway/scratchpad"
        ];
        modules-right = [
          "bluetooth"
          "pulseaudio"
          "clock"
        ];
        "sway/workspaces" = {
          format = "|{icon}|";
        };
        "sway/mode" = {
          format = "[{}]";
        };
        "clock" = {
          format = "{: %H:%M}";
          format-alt = "{: %A %d/%m/%y  %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          format-icons = ["" ""];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        cpu = {
          min-length = 6;
          format = " {usage}%";
          tooltip = true;
        };
        memory = {
          min-length = 6;
          format = " {}%";
        };
        temperature = {
          thermal-zone = 2;
          min-length = 6;
          critical-treshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
        };
        pulseaudio = {
          min-length = 6;
          scroll-step = 2;
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            default = ["󰕾"];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        bluetooth = {
          format = "";
          format-disabled = "";
          tooltip-format = "{num_connections} connected";
          tooltip-format-connected = "{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "${pkgs.blueman}/bin/blueman-manager";
        };
      }
    ];
    style = ''
           * {
               font-family: "JetBrainsMono Nerd Font";
               font-size: 16px;
               border: none;
               border-radius: 0;
           }

           #window {
               color: #fbf1c7;
           }

           window#waybar {
               background-color: #32302f;
           }

           button {
               box-shadow: inset 0 -3px transparent;
               border: none;
               border-radius: 0;
           }

           button:hover {
               background: inherit;
           }

           #workspaces button {
               padding: 0 2px;
               background-color: transparent;
               color: #eddbb2;
           }

           #workspaces button:hover {
             box-shadow: inherit;
      text-shadow: inherit;
           }

           #workspaces button.focused {
               color: #458588;
           }


           #workspaces button.urgent {
               color: #cc241d;
           }

           #mode {
               color: #98971a;
           }

           /* If workspaces is the leftmost module, omit left margin */
           .modules-left > widget:first-child > #workspaces {
               margin-left: 0;
           }

           /* If workspaces is the rightmost module, omit right margin */
           .modules-right > widget:last-child > #workspaces {
               margin-right: 0;
           }



           /* Modules rounded corners */
           .modules-left {
               background: #32302f;
               color: #eddbb2;
               border-radius: 0px 0px 5px 5px;
               padding: 0 4px;
           }

           .modules-center {
               background-color: #32302f;
               color: #eddbb2;
               border-radius: 0px 0px 5px 5px;
               padding: 0 10px;
               margin: 0 4px;
           }
           .modules-right {
               background: #32302f;
               color: #eddbb2;
               border-radius: 0px 0px 5px 5px;
               padding: 0 4px; /* Alternate layout: 0 10px; */
           }
    '';
  };
}
