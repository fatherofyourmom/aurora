{ config, lib, pkgs, auroraTheme, ... }:

{
  # Install Aurora theme fonts
  fonts.packages = with pkgs; [
    # Primary fonts from theme
    inter
    jetbrains-mono
    space-grotesk
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans

    # Icon fonts
    font-awesome
    material-icons
    material-symbols

    # Additional nerd fonts for terminal icons
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "FiraCode"
        "Hack"
      ];
    })
  ];

  # Enable fontconfig and configure defaults
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      serif = [ "Inter" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrains Mono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
