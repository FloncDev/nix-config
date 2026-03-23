{ inputs, ... }:
{
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  flake.modules.nixos.catppuccin = {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];

    home-manager.sharedModules = [
      inputs.catppuccin.homeModules.catppuccin
      {
        catppuccin = {
          enable = true;
          flavor = "mocha";
        };
      }
    ];
  };
}
