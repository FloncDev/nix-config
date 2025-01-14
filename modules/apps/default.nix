{ pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./kitty.nix
    ./firefox.nix
    ./spotify.nix
  ];

  home.packages = (with pkgs; [
    ani-cli
    (if pkgs.stdenv.isDarwin then pkgs.iina else pkgs.mpv)
  ]);
}
