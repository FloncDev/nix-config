{
  inputs,
  ...
}:
{
  # Manage your macOS using Nix
  # https://github.com/nix-darwin/nix-darwin

  flake-file.inputs = {
    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
