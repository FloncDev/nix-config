# Imported per-host
{ inputs, ... }:
{
  # TODO: All stuff for an actual nixos system
  flake.modules.nixos.boot =
    { pkgs, ... }:
    {
      # boot.loader.systemd-boot.enable = true;
      boot = {
        loader = {
          systemd-boot.enable = true;
          ## Defined in minimal.nix
          # efi.canTouchEfiVariables = true;
        };

        kernelPackages = pkgs.linuxPackages_latest;

        kernel.sysctl."kernel.sysrq" = 1;

        blacklistedKernelModules = [ "nouveau" ];

        # TODO: Move to desktop when added
        # # Only show main monitor on boot
        # kernelParams = [
        #   "video=DP-3:2560x1440@60e"
        #   "video=HDMI-A-1:e"
        # ];
      };
    };
}
