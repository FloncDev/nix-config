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
        wakatime
        headsetcontrol
      ];

      home-manager.sharedModules = with inputs.self.modules.homeManager; [
        default-apps
      ];

    };

  flake.modules.darwin.default-apps =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.darwin; [ ];

      environment.systemPackages = with pkgs; [
        raycast
      ];

      home-manager.sharedModules = with inputs.self.modules.homeManager; [
        default-apps
      ];
    };

  flake.modules.homeManager.default-apps =
    { pkgs, lib, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        discord
        spotify
        {
          home.packages =
            with pkgs;
            [
              # Desktop applications go here
              firefox
              vscode
              zed-editor
              prismlauncher
              obsidian
            ]
            ++ lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") [
              chromium
              lunar-client
              pavucontrol
              easyeffects
              multiviewer-for-f1
            ];
        }
      ];
    };
}
