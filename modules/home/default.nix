{ inputs, username, host, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./neovim.nix
    ./qtile
    ./kitty.nix
    ./git.nix
    ./spotify.nix
  ];

  home.packages = (with pkgs; [
    bat
    firefox
    rofi
    (discord.override {
      withVencord = true;
    })
  ]);
}
