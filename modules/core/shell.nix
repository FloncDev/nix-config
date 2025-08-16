{
  pkgs,
  host,
  ...
}:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"; then
        exec Hyprland
      end
      starship init fish | source
      direnv hook fish | source
      nix-your-shell fish | source
    '';

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
