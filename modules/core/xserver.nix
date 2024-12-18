{ pkgs, username, host, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      windowManager.i3.enable = true;
      windowManager.qtile.enable = true;
    };

    displayManager.autoLogin = {
      enable = false;
      user = "${username}";
    };

    displayManager.defaultSession = "qtile";
  };

  # Prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
