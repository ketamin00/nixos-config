{config, pkgs, ...}:

{
  imports = [
    ./conky.nix
  ];

  programs.conky.enable = true;
}
