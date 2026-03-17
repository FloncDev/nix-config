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
          # "DP-2, 1920x1080, 0x1080, 1"
          "HDMI-A-1, 1920x1080, 0x0, 1, transform, 1"
        ];

        # TODO: Some more of these
      };
    };
  };
}
