{ inputs, ... }:
{
  flake.darwinConfigurations = inputs.self.lib.mkDarwin "aarch64-darwin" "darwin";

  flake.modules.darwin.darwin = {
    imports = with inputs.self.modules.darwin; [
      default
      flonc
      default-apps
    ];

    networking.hostName = "darwin";
  };
}
