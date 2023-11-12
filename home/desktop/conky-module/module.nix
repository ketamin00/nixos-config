{ config, lib, pkgs, ... }:

{
  options.programs.conky = {
    enable = lib.mkEnableOption "Conky desktop widget";

    config = lib.mkOption {
      type = lib.types.str;
      default = builtins.readFile ./default.conf;
      description = "Conky configuration.";
    };

  };

  config = lib.mkIf config.programs.conky.enable {
    home.packages = [ pkgs.conky ];

  };
}
