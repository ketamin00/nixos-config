{ config, pkgs, colors, ... }:
{
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font";
    backgroundColor = colors.bg;
    defaultTimeout = 10000;
  };
}