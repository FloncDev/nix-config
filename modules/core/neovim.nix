{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    gcc
    unzip
    nodejs_23
    rustup

    nixd
    alejandra
    deadnix
    statix
  ];
}
