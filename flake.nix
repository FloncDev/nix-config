{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
  };

  outputs = { self, nixpkgs, darwin, ... }@inputs:
  let
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
        specialArgs = { host="desktop"; inherit self inputs username; };
        modules = [ ./hosts/desktop ];
      };
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { host="vm"; inherit self inputs username; };
	      modules = [ ./hosts/vm ];
      };
    };

    darwinConfigurations = {
      darwin = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { host="darwin"; inherit self inputs username; };
        modules = [ ./hosts/darwin ];
      };
    };
  };
}
