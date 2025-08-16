{ pkgs, ... }:
{
  programs.lutris = {
    enable = true;

    # winePackages = with pkgs; [
    #   wineWowPackages.stable
    #   winetricks
    # ];
  };

  home.packages = with pkgs; [
    wineWowPackages.stable
    winetricks
  ];
}
