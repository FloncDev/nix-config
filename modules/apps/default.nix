{ pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./kitty.nix
    ./firefox.nix
    ./spotify.nix
  ];

  home.packages = (with pkgs; [
    # firefox
    # (discord.override {
    #   withVencord = true;
    # })
  ]);
}
