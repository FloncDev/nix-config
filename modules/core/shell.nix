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
          # TODO: Change? Or figure out how to have auto detect
          nrs = "nh os switch /home/flonc/nix#desktop";
        };
      };

      programs.starship = {
        enable = true;

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
          nix_shell = {
            impure_msg = "";
          };
        };
      };
    };
}
