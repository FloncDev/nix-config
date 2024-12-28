{ pkgs, ... }:
{
  imports = [
    # ../home/shell.nix
    # ../home/git.nix
    ../apps
  ];

  home.packages = with pkgs; [
    # raycast
    # discord
  ];
}
