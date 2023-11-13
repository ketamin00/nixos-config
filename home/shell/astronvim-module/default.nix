{ config, lib, pkgs, astronvim, ... }:

let
  cfg = config.programs.astronvim;
  package = import ./package.nix {inherit (pkgs) stdenv; inherit astronvim; };
in
{
  options.programs.astronvim = {
    enable = lib.mkEnableOption "AstroNvim";

  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ neovim ];

    home.file.".config/nvim".source = package;
  };
}
