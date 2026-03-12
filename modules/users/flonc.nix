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

        programs.git = {
          settings = {
            user.name = "FloncDev";
            user.email = "37045958+FloncDev@users.noreply.github.com";
          };

          # TODO: Figure out what to do with GPG key
          # TODO Have GPG key saved with nix config, also this will need to change per-device
          # signing.key = "C4BB780AFDE394ED";
        };
      };
    }
  ];

  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "flonc";
}
