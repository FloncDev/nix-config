{ ... }:
{
  services.mako = {
    enable = true;

    settings = {
      font = "JetBrainsMono Nerd Font 12";

      border-radius = "5";
      default-timeout = "15000";

      layer = "overlay";
      anchor = "top-right";
      output = "HDMI-A-1";
    };
  };
}
