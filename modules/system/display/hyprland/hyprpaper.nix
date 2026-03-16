{ ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      wallpaper = [
        {
          monitor = "DP-3";
          path = "./wallpaper.png";
          fit_mode = "cover";
        }
        {
          monitor = "HDMI-A-1";
          path = "./wallpaper.png";
          fit_mode = "cover";
        }
      ];

      splash = false;
    };
  };
}
