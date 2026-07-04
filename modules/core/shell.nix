{ inputs, ... }:
{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          starship init fish | source
          set -U fish_greeting
        '';

        shellAbbrs = {
          nrs = "nh os switch /etc/nixos#desktop";
          nds = "nh darwin switch /etc/nixos#darwin";
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
