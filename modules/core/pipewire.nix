{ lib, pkgs, ... }:
{
  hardware.pulseaudio.enable = lib.mkForce false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pulseaudioFull
  ];
}
