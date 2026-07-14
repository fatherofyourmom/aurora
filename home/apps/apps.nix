{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browser
    firefox

    # Editor
    helix

    # File manager (KDE)
    dolphin

    # Media
    mpv
    vlc

    # Communication
    discord
    thunderbird

    # Office
    libreoffice-fresh
  ];

  # Firefox configuration
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "browser.theme.content-theme" = 1;
        "browser.theme.toolbar-theme" = 1;
        "font.name.monospace.x-western" = auroraTheme.fonts.mono;
        "font.name.sans-serif.x-western" = auroraTheme.fonts.sans;
      };
    };
  };

  # Helix editor configuration
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        color-modes = true;
      };
    };
  };
}
