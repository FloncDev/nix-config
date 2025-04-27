{ pkgs, ... }:
{
  imports = [
    # ../home/shell.nix
    # ../home/git.nix
    ../apps
    ../display
  ];

  home.packages = with pkgs; [
    # raycast
    # discord
  ];
}
