{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./neovim.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    bat
    anki-bin
    direnv
    devenv
  ];
}
