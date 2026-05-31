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
            hashedPassword = "$y$j9T$D9ygqQDxr4hbRvEMUaJNo.$NWpgsQ/giGjeoC6cVwHciTbT2jrUJDcL2QlMB2nEES3";
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };

          environment.systemPackages = with pkgs; [

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
          cli
          neovim
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

        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "text/html" = "firefox.desktop";
            "x-scheme-handler/http" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/about" = "firefox.desktop";
            "x-scheme-handle/unknown" = "firefox.desktop";
          };
        };
      };
    }
  ];

  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "flonc";
}
