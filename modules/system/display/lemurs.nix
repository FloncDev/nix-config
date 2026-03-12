{ ... }:
{
  flake.modules.nixos.lemurs = {
    services.displayManager.lemurs.enable = true;

    environment.etc."lemurs/wayland/hyprland" = {
      text = ''
        exec start-hyprland
      '';
      mode = "0755";
    };
  };
}
