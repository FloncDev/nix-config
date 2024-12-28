{ pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./kitty.nix
  ];

  home.packages = (with pkgs; [
    # firefox
    # (discord.override {
    #   withVencord = true;
    # })
  ]);
}
