{pkgs, colors, ...}: {

  programs.swaylock = 
  let
    transparent = "00000000";
  in
  {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      indicator-idle-visible = true;
      show-failed-attempts = true;
      indicator-radius = 100;

      font = "JetBrainsMono Nerd Font";
      font-size = 24;

      color = colors.bg;
      
      key-hl-color = colors.green;
      bs-hl-color = colors.red;
      separator-color = transparent;
      
      inside-color = transparent;
      ring-color = colors.fg;
      line-color = colors.bg0_h;

      inside-clear-color = transparent;
      ring-clear-color = colors.yellow;
      line-clear-color = colors.bg0_h;
      text-clear-color = colors.yellow;

      inside-caps-lock-color = transparent;
      ring-caps-lock-color = colors.aqua;
      line-caps-lock-color = colors.bg0_h;
      text-caps-lock-color = colors.fg;
      caps-lock-key-hl-color = colors.green;
      caps-lock-bs-hl-color = colors.red;

      inside-ver-color = transparent;
      ring-ver-color = colors.fg;
      line-ver-color = colors.blue;
      text-ver-color = colors.blue;

      inside-wrong-color = transparent;
      ring-wrong-color = colors.red2;
      line-wrong-color = colors.bg0_h;
      text-wrong-color = colors.red;

    };
  };
}
