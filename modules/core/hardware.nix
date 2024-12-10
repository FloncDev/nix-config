{ pkgs, ... }:
{
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [ pkgs.mesa.drivers ];
}
