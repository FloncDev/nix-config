{ self, ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      imports = with self.modules.homeManager; [
        yazi
      ];

      programs.fish = {
        shellAliases = {
          neofetch = "fastfetch";
          cat = "bat";
        };
      };

      home.packages = with pkgs; [
        btop
        wget
        fastfetch
        dua
        bat
        jq
        nh

        # TODO: Look into lorri or alternatives
        direnv
        nix-direnv
      ];
    };
}
