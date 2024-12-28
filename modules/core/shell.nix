{ pkgs, host, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = "starship init fish | source";

    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#${host}";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
    };
  };
}
