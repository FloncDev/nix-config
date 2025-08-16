{ pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        keyboardShortcut
        copyToClipboard
        betterGenres
        beautifulLyrics
        songStats
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
