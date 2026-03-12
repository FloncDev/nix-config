{ ... }:
{
  flake.modules.homeManager.git =
    { pkgs, ... }:
    {
      programs.git = {
        enable = true;

        settings = {
          init.defaultBranch = "main";
        };
      };

      home.packages = with pkgs; [
        gh
      ];
    };
}
