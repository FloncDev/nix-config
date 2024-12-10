{ pkgs, username, host, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      windowManager.qtile.enable = true;
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };

    displayManager.defaultSession = "qtile";
  };

  # Prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
