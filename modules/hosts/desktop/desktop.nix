{ ... }:
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "desktop";

  flake.modles.nixos.desktop =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        default
        boot
        default-display
        hyprland
        default-apps
        earlyoom
      ];

      # Only show main monitor on boot
      # Not sure if this actually works
      kernelParams = [
        "video=DP-3:2560x1440@60e"
        "video=HDMI-A-1:e"
      ];
    };
}
