{ inputs, nixpkgs, ... }:
{
  imports = [
    ./bootloader.nix
    ./network.nix
    ./pipewire.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./xserver.nix
    ./user.nix
    ./programs.nix
    ./hardware.nix
  ];
}
