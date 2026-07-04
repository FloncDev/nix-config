{ inputs, ... }:
{
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  flake.modules.nixos.flatpak = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;
      packages = [
        "org.vinegarhq.Sober"
      ];
    };
  };
}
