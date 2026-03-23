# Shared config for all systems with a desktop environment.
{ ... }:
{
  flake.modules.nixos.default-display =
    { pkgs, ... }:
    {
      services = {
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          # TODO: Check why false and what jack does
          jack.enable = false;
          wireplumber.enable = true;
        };

        # Maybe move this into desktop
        libinput.mouse = {
          accelProfile = "flat";
          accelSpeed = "-2.8";
        };

        xserver = {
          enable = false;
          xkb.layout = "us";

          videoDrivers = [ "nvidia" ];
        };

        dbus.enable = true;
        gnome.gnome-keyring.enable = true;
      };

      environment.systemPackages = with pkgs; [
        # Better cjk font
        noto-fonts-cjk-sans
      ];
    };
}
