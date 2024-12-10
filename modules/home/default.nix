{ inputs, username, host, ... }:
{
  imports = [
    ./fish.nix
    # ./cava.nix
    ./neovim.nix
    ./qtile
    ./kitty.nix
    ./rofi.nix
    ./picom.nix
    ./firefox.nix
    ./discord.nix
    ./git.nix
  ];
}
