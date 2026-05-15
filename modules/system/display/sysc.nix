{ inputs, ... }:
{
  flake-file.inputs.sysc.url = "github:Nomadcxx/sysc-greet";

  flake.modules.nixos.sysc =
    { lib, ... }:
    {
      imports = [
        inputs.sysc.nixosModules.default
      ];

      services.sysc-greet = {
        enable = true;
        compositor = "hyprland";
      };

      # Use custom config to support monitor setup
      environment.etc."greetd/hyprland-greeter-config.conf".source =
        lib.mkForce ./hyprland-greeter-config.conf;
    };
}
