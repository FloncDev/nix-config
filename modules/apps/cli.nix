{ ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
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

        # Need to figure out devenvs for this
        nixd
        nixfmt-rfc-style
      ];
    };
}
