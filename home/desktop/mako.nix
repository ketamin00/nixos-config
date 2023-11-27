{ config, pkgs, colors, ... }:
{
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font";
    backgroundColor = colors.bg;
  };
}