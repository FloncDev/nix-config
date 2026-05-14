{ inputs, ... }:
{
  flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";

  flake.modules.homeManager.secrets =
    { config, pkgs, ... }:
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];
      home.packages = with pkgs; [
        sops
        age
        ssh-to-age
      ];
    };
}
