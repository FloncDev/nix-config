{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    catppuccin.url = "github:catppuccin/nix";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-your-shell = {
      url = "github:MercuryTechnologies/nix-your-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      darwin,
      catppuccin,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      username = "flonc";
      # pkgs = import nixpkgs {
      #   inherit system;
      #   config.allowUnfree = true;
      # };
      lib = nixpkgs.lib;
    in
    {

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            host = "desktop";
            inherit
              self
              inputs
              username
              ;
          };
          modules = [
            ./hosts/desktop
            catppuccin.nixosModules.catppuccin
          ];
        };
        vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            host = "vm";
            inherit
              self
              inputs
              username
              ;
          };
          modules = [
            ./hosts/vm
            catppuccin.nixosModules.catppuccin
          ];
        };
      };

      darwinConfigurations = {
        darwin = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            host = "darwin";
            inherit
              self
              inputs
              username
              ;
          };
          modules = [
            ./hosts/darwin
            catppuccin.darwinModules.catppuccin
          ];
        };
      };
    };
}
