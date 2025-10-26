{ ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "/etc/nixos/modules/display/qtile/src/evening-sky.png" ];
      wallpaper = [ ", /etc/nixos/modules/display/qtile/src/evening-sky.png" ];
    };
  };
}
