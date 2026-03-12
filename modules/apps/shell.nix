{ inputs, ... }:
{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          starship init fish | source
        '';

        shellAbbrs = {
          nrs = "echo testing";
        };
      };

      programs.starship = {
        enable = true;

        # TODO: Make sure this works
        settings = {
          add_newline = true;
          right_format = "$sudo $time";
          time = {
            disabled = false;
            use_12hr = true;
            style = "bright-black";
            format = "[$time]($style)";
          };
          sudo = {
            disabled = false;
            symbol = "*";
            format = "[$symbol]($style)";
          };
        };
      };
    };
}
