{ config, lib, pkgs, ... }:

{
  options.programs.conky = {
    enable = lib.mkEnableOption "Conky desktop widget";

  };

  config = lib.mkIf config.programs.conky.enable {
    home.packages = [ pkgs.conky ];

  };
}
