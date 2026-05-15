{ ... }:
{
  flake.modules.nixos.tailscale =
    { config, ... }:
    {
      services.tailscale = {
        enable = true;
        authKeyFile = config.sops.secrets.tailscale_auth_key.path;
      };

      # Prevent systemd from waiting for network online
      systemd.network.wait-online.enable = false;
    };
}
