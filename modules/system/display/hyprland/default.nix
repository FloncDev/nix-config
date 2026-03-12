{ inputs, ... }:
{
  flake.modules.nixos.hyprland = {
    home-manager.sharedModules = [
      inputs.self.modules.homeManager.hyprland
    ];

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        "$terminal" = "kitty";
        "$mod" = "SUPER";

        bind = [
          "$mod, return, exec, $terminal"
        ];
      };

    };

    # home.packages = with pkgs; [
    #   rofi
    # ];

  };
}
