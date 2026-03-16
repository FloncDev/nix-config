{ ... }:
{
  flake.modules.nixos.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 7;
    freeMemKillThreshold = 2;
  };
}
