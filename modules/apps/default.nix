{ pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./kitty.nix
    ./firefox.nix
    # ./spotify.nix
  ];

  home.packages = (with pkgs; [
    ani-cli
    (if pkgs.stdenv.isDarwin then pkgs.iina else pkgs.mpv)
    jetbrains.rider
    # Currently using vscode sync instead of nix for config
    vscode
    jellyfin-media-player
  ]);
}
