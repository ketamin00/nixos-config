{ config, pkgs}:
{
  imports = [
    ./astronvim-module
  ];
  programs.astronvim.enable = true;
}
