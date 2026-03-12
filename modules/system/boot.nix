{ inputs, ... }:
{
  # TODO: All stuff for an actual nixos system
  flake.modules.nixos.systemd-boot =
    { pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = true;
    };
}
