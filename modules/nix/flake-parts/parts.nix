{ inputs, ... }:
{
  # flake-file.inputs = {
  #   flake-parts.url = "github:hercules-ci/flake-parts";
  #   flake-file.url = "github:vic/flake-file";
  #   import-tree.url = "github:vic/import-tree";
  # };

  # imports = [
  #   inputs.flake-parts.flakeModules.modules
  #   inputs.flake-file.flakeModules.modules
  # ];

  # flake-file.outputs = ''
  #   inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)
  # '';

  imports = [
    inputs.flake-file.flakeModules.dendritic
  ];

  systems = [
    "aarch64-darwin"
    "x86_64-linux"
  ];
}
