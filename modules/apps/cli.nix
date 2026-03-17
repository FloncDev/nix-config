{ ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      programs.fish = {
        shellAliases = {
          neofetch = "fastfetch";
        };
      };

      home.packages = with pkgs; [
        btop
        wget
        fastfetch
      ];
    };
}
