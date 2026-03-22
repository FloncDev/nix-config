{ inputs, ... }:
{
  flake.modules.nixos.desktop = {
    home-manager.sharedModules = [
      inputs.self.modules.homeManager.desktop-hyprland
    ];
  };

  flake.modules.homeManager.desktop-hyprland = {
    wayland.windowManager.hyprland = {
      settings = {
        monitor = [
          "DP-3, 2560x1440@165, 1080x480, 1"
          "HDMI-A-1, 1920x1080, 0x0, 1, transform, 1"
        ];

        workspace = [
          "1, monitor:DP-3"
          # TODO: Make games go to this workspace
          "name:games, monitor:DP-1, shadow:false, decorate:false, rounding:false, border:false, gapsout:0"
        ];

        # TODO: Some more of these
      };
    };

    # Have bar only on second monitor
    programs.waybar.settings.secondaryBar.output = [ "HDMI-A-1" ];
  };
}
