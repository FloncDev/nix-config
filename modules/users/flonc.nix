{
  inputs,
  self,
  lib,
  ...
}:
{
  # TODO: Make package groups
  flake.modules = lib.mkMerge [
    (self.factory.user "flonc" true)
    {
      nixos.flonc =
        { pkgs, ... }:
        {
          users.users.flonc = {
            password = "123";
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };

          environment.systemPackages = with pkgs; [
            nh
          ];
          # ...
        };

      darwin.flonc = {
        # ...
      };

      homeManager.flonc = {
        # ...
        imports = with self.modules.homeManager; [
          kitty
        ];
      };
    }
  ];

  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "flonc";
}
