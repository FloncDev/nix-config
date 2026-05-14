# Collection of desktop applications.
{ inputs, ... }:
{
  flake.modules.nixos.default-apps =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        # Imports go here
        # TODO: Steam
        nord
      ];

      home-manager.sharedModules = with inputs.self.modules.homeManager; [
        # More imports that are home managers here
        discord
        spotify
        {
          home.packages = with pkgs; [
            # Desktop applications go here
            firefox
            chromium
            vscode
            zed-editor
            lunar-client
            prismlauncher
            pavucontrol
            multiviewer-for-f1
          ];
        }
      ];

    };
}
