{ pkgs, inputs, username, host, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./../../modules/core
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username hosts; };
    users.${username} = {
      imports = [ ../home ];
    };
  };
}
