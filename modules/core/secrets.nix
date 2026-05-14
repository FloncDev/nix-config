{ inputs, ... }:
{
  flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";

  flake.modules.nixos.secrets =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      environment.systemPackages = with pkgs; [
        sops
        age
        ssh-to-age
      ];

      sops = {
        # age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
        age.sshKeyPaths = [ "${config.users.users.flonc.home}/.ssh/id_ed25519" ];
        age.generateKey = false;
        defaultSopsFile = ../../secrets/secrets.yaml;
        validateSopsFiles = true;
        secrets =
          (lib.mapAttrs (
            name: value: {
              owner = config.users.users.flonc.name;
            }
          ))
            {
              "hello" = { };
            };
      };
    };
}
