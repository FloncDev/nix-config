{ ... }:
{
  services.mako = {
    enable = true;

    settings = {
      font = "JetBrainsMono Nerd Font 12";

      border-radius = "5";
      default-timeout = "15000";

      layer = "overlay";
      anchor = "center-right";
      output = "HDMI-A-1";

      height = "300";
    };
  };
}
