{ inputs, ... }:
{
  flake.modules.homeManager.kitty =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      fonts.fontconfig.enable = true;

      programs.kitty = {
        enable = true;

        settings = {
          font_family = "JetBrain Mono Nerd Font";
          font_size = "12.0";

          background_opacity = "0.96";
          window_padding_width = 4;

          disable_ligatures = "never";
        };

        # TODO: Add catppuccin theme
        # themeFile = "Catppuccin-Mocha";
      };

    };
}
