{ pkgs, ... }:
{
  imports = [
    ../home/kitty.nix
    ../home/shell.nix
    ../home/git.nix
  ];

  home.packages = with pkgs; [
    raycast
    discord
  ];
}
