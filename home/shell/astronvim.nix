{ config, pkgs, astronvim, ...}:
{
  imports = [
    ./astronvim-module
  ];
  programs.astronvim.enable = true;
}
