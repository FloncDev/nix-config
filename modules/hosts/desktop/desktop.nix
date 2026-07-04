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
        flatpak
      ];

      boot.kernelParams = [
        "video=DP-3:2560x1440@60"

        "zswap.enabled=1"
      ];

      # Fix for bluetooth dongle
      services.udev.extraRules = ''
        	  ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="${lib.getExe pkgs.usb-modeswitch} -K -v 0bda -p 1a2b"
        	'';

      # Enable swap
      swapDevices = [
        {
          device = "/dev/disk/by-uuid/df7048a5-a4b9-427c-a22d-b95f4f9f9edd";
        }
      ];
    };
}
