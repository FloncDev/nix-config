{ inputs, username, host, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./neovim.nix
    ./qtile
    # ./i3.nix
    ./kitty.nix
    ./git.nix
    ./spotify.nix
    ./japanese.nix
  ];

  home.packages = (with pkgs; [
    bat
    firefox
    rofi
    (discord.override {
      withVencord = true;
    })

    ## Needed for media controls
    alsa-utils
    playerctl
  ]);
}
