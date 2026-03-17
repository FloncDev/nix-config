{ ... }:
{
  flake.modules.nixos.earlyoom = {
    services.earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 7;
      freeMemKillThreshold = 2;
    };
  };
}
