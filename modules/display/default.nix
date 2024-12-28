{ pkgs, ... }:
{
  # TODO: Make some sort of module thing so I can change between WMs easier
  imports = [
    ./qtile
    # ./i3.nix
    ./japanese.nix
  ];

  # Will probably need to move this - rofi doesn't work for wayland (I think?)
  home.packages = with pkgs; [
    rofi
  ];
}
