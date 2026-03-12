{ ... }:
{
  # TODO: Add ssh-config here
  flake.modules.nixos.ssh = {
    services.openssh.enable = true;
  };
}
