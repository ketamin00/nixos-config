{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  users.users.julius = {
    isNormalUser = true;
    description = "Julius";
    extraGroups = ["networkmanager" "wheel" "docker" "storage" "disk"];
    shell = pkgs.zsh;
  };
}
