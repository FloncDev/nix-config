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
        # TODO: Refactor / Look into lorri or alternatives
        nixd
        nixfmt-rfc-style
        package-version-server
        direnv
        nix-direnv
      ];
    };
}
