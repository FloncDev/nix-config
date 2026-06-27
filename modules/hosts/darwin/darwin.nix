{ inputs, ... }:
{
  flake.darwinConfigurations = inputs.self.lib.mkDarwin "aarch64-darwin" "darwin";

  flake.modules.darwin.darwin = {

  };
}
