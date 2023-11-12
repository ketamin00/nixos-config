{ config, lib, pkgs, ... }:
let
  cfg = config.programs.conky;
in
{
  options.programs.conky = {
    enable = lib.mkEnableOption "Conky desktop widget";

    config = lib.mkOption {
      type = lib.types.str;
      default = builtins.readFile ./default.conf;
      description = "Conky configuration.";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.conky;
      description = "The Conky package to use.";
    };

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.conky ];
    xdg.configFile."conky/conky.conf".text = config.programs.conky.config;

  };
}
