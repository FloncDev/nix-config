{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-mozc
    ];
  };

  home.sessionVariables.GLFW_IM_MODULE = "ibus";

  home.packages = with pkgs; [
    noto-fonts-cjk-sans
  ];
}
