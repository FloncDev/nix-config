{ inputs, pkgs, ... }:
{
  xdg.configFile."qtile" = {
    source = ./src;
    recursive = true;
  };
}
