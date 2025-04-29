{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./neovim.nix
    ./git.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  home.packages = with pkgs; [
    bat
    anki-bin
    direnv
    devenv
    jq
    btop
    nil
    nixfmt-rfc-style
  ];
}
