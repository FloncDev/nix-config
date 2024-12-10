{ ... }:
{
  services = {
    gnome.gnome-keyring.enable = true;
    libinput.mouse = {
      accelProfile = "flat";
      accelSpeed = "-2.8";
    };
    picom.enable = true;
  };
}
