{
  pkgs,
  colors,
  ...
}: {
  services.swayidle = {
    enable = true;
    timeouts [
      timeout = 5;
      command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
    ];
  };
}
