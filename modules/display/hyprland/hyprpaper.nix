{ ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "/etc/nix/modules/display/qtile/src/evening-sky.png" ];
      wallpaper = [ ",/etc/nix/modules/display/qtile/src/evening-sky.png" ];
    };
  };
}
