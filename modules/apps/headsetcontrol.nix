{ ... }:
{
  flake.modules.nixos.headsetcontrol =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.headsetcontrol.overrideAttrs (oldAttrs: rec {
          version = "unstable-2026";
          src = pkgs.fetchFromGitHub {
            owner = "Sapd";
            repo = "HeadsetControl";
            rev = "e3a2afaa940406d3ec996efae0746940aea68a8c";
            hash = "sha256-o1mN9yfGNu+aLBF3VmTyHzD98bqb5oMOV7BjoQNQTAc=";
          };
        }))
        pkgs.usbutils
      ];
      services.udev.packages = [ pkgs.headsetcontrol ];
      services.udev.extraRules = ''
        # Rule for the USB device itself
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="226d", MODE="0666", TAG+="uaccess"

        # Rule for all exposed hidraw interfaces
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="226d", MODE="0666", TAG+="uaccess"
      '';
      # users.users.flonc.extraGroups = [ "input" ];
    };
}
