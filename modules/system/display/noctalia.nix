{ inputs, ... }:
{
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.noctalia =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
      ];
    };
}
