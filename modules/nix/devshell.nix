{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.default =
      let
        system = pkgs.stdenvNoCC.targetPlatform.system;
      in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          nil
          nixfmt
          nixd
        ];
      };
  };
}
