{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    plugins = [ ];
  };

  home.packages = with pkgs; [
    gcc
    unzip
    # nodejs_23
    rustup

    nixd
    alejandra
    deadnix
    statix
  ];
}
