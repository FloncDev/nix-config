{ pkgs, ... }:
{
  # imports = [
  #   ./user.nix
  # ];

  # programs.fish.shellAliases = {
  #   nixos-rebuild = "darwin-rebuild";
  # };
  
  home.packages = with pkgs; [
    raycast
  ];
}
