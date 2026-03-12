{ inputs, ... }:
{
  flake.modules.nixos.minimal =
    { pkgs, ... }:
    {
      system.stateVersion = "25.05";
      nixpkgs.config.allowUnfree = true;
      boot.loader.efi.canTouchEfiVariables = true;

      nix.settings = {
        experimental-features = "nix-command flakes";

        trusted-users = [ "root" ];
      };

      environment.pathsToLink = [
        "/share/application"
        "/share/xdg-desktop-portal"
      ];
    };
}
