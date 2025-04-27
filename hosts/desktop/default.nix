{ pkgs, inputs, username, host, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/core
    # ./../../modules/nixos
    # ./../../modules/core
  ];

  # home-manager = {
  #   useUserPackages = true;
  #   useGlobalPkgs = true;
  #   extraSpecialArgs = { inherit inputs username host; };
  #   users.${username} = {
  #     imports = [
  #       # ../../modules/nixos
  #       ../../modules/nixos/home.nix
  #       ../../modules/core
  #     ];
  #   };
  # };
}
