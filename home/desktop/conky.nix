{config, pkgs, unstable, ...}:

{
  imports = [
    ./conky-module
  ];

  programs.conky.enable = false;
  programs.conky.package = unstable.conky;
}
