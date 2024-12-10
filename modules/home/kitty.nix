{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.enable = true;

  programs.kitty = lib.mkForce {
    enable = true;

    settings = {
      font_family = "JetBrain Mono Nerd Font";
      font_size = "12.0";

      background_opacity = "0.96";
      window_padding_width = 4;

      disable_ligatures = "never";
    };

    themeFile = "Catppuccin-Mocha";
  };

}
