{ pkgs, ... }:
{
  # TODO: Somehow move this to /modules/apps
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
  ];
}
