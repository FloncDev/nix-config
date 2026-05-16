{ inputs, ... }:
{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [ inputs.self.modules.homeManager.steam ];

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        protontricks.enable = true;
      };

      programs.gamescope.enable = true;

      environment.systemPackages = with pkgs; [
        protonup-qt
        # TODO: Try out protonplus instead and pick the better option
        protonplus
      ];
    };

  flake.modules.homeManager.steam = {
    programs.mangohud.enable = true;
  };
}
