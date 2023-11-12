{config, pkgs, ...}:

{
  imports = [
    ./conky-module.nix
  ];

  programs.conky.enable = true;
}
