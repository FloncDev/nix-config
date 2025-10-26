{ pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./kitty.nix
    ./firefox.nix
    ./spotify.nix
    ./mangohud.nix
    ./lutris.nix
  ];

  home.packages = (
    with pkgs;
    [
      ani-cli
      (if pkgs.stdenv.isDarwin then pkgs.iina else pkgs.mpv)
      # jetbrains.rider
      # jetbrains.datagrip
      # Currently using vscode sync instead of nix for config
      vscode
      lunar-client
      prismlauncher
      firefox
      dbvisualizer
      jdk21
      httpie-desktop
      lumafly
      pavucontrol
      overlayed
      chromium
      scrcpy
    ]
  );
}
