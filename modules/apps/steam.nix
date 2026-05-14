{ ... }:
{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        protontricks.enable = true;
      };

      environment.systemPackages = with pkgs; [
        protonup-qt
        # TODO: Try out protonplus instead and pick the better option
        protonplus
      ];
    };
}
