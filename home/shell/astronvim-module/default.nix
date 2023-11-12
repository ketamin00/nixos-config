{ config, lib, pkgs, astronvim, ... }:

let
  cfg = config.programs.astronvim;
in
{
  options.programs.astronvim = {
    enable = lib.mkEnableOption "AstroNvim";

  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ neovim ];

    home.file.".config/nvim".source = astronvim;
  };
}
