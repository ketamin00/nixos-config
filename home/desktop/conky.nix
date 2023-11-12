{config, pkgs, ...}:

{
  imports = [
    ./conky-module
  ];

  programs.conky.enable = true;
}
