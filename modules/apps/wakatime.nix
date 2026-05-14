{ inputs, ... }:
{
  flake.modules.nixos.wakatime =
    { pkgs, config, ... }:
    {
      home-manager.sharedModules = [ inputs.self.modules.homeManager.wakatime ];

      environment.systemPackages = [ pkgs.wakatime-cli ];

      sops.templates.".wakatime.cfg" = {
        content = ''
          [settings]
          api_url = ${config.sops.placeholder.wakatime_api_url}
          api_key = ${config.sops.placeholder.wakatime_api_key}
        '';

        owner = "flonc";
        mode = "0440";
      };
    };

  flake.modules.homeManager.wakatime =
    { osConfig, config, ... }:
    {
      # home.file.".wakatime.cfg".source = "${osConfig.sops.templates.".wakatime.cfg".path}";
      home.file.".wakatime.cfg".source =
        config.lib.file.mkOutOfStoreSymlink "${osConfig.sops.templates.".wakatime.cfg".path}";
    };
}
