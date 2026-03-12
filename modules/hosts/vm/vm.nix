{ inputs, ... }:
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "vm";

  flake.modules.nixos.vm =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        default
        systemd-boot
        hyprland
        ssh
      ];

      virtualisation.vmVariant.virtualisation = {
        memorySize = 4096;
        cores = 4;
        forwardPorts = [
          {
            from = "host";
            host.port = 2222;
            guest.port = 22;
          }
        ];
      };
    };
}
