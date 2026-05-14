{ ... }:
{
  flake.modules.nixos.ssh = {
    services = {
      openssh.enable = true;
      # SSH Should hopefully never be exposed, but just in case ;)
      fail2ban.enable = true;
    };

    # TODO: Add ssh public keys of my machines

    programs.ssh = {
      # TODO: Better naming scheme for local vs tailscale
      extraConfig = "
        Host localdesktop
          HostName 192.168.0.2
          User flonc

        Host localdenshi
          HostName 192.168.0.3
          User flonc

        Host localhome
          HostName 192.168.0.4
          User flonc
      ";
    };
  };
}
