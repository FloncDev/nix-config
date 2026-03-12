{ ... }:
{
  flake.modules.nixos.networking = {
    networking = {
      networkmanager.enable = true;
      nameservers = [
        "8.8.8.8"
        "8.8.4.4"
        "1.1.1.1"
      ];

      # TODO: Have no ports open and use tailscale
      # Also need some sort of backup for if tailscale is down
      firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ ];
      };

      # Stop getting long network interface names
      usePredictableInterfaceNames = false;
    };
  };
}
