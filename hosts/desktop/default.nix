{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];
}
