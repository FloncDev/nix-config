{ inputs, ... }:
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "desktop";

  flake.modules.nixos.desktop =
    { pkgs, lib, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        default
        boot
        hardware
        earlyoom
        tailscale

        default-display
        hyprland
        # lemurs
        sysc
        noctalia
        keyd

        flonc
        default-apps
        catppuccin
        steam
      ];

      # Only show main monitor on boot
      # Not sure if this actually works
      boot.kernelParams = [
        "video=DP-3:2560x1440@60"
        # "video=HDMI-A-1:e"
      ];

      # Fix for bluetooth dongle
      services.udev.extraRules = ''
        	  ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="${lib.getExe pkgs.usb-modeswitch} -K -v 0bda -p 1a2b"
        	'';
    };
}
