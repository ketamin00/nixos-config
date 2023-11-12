{config, pkgs, unstable, ...}:

{
  imports = [
    ./conky-module
  ];

  programs.conky.enable = true;
  programs.conky.package = unstable.conky;
}
