{ config, lib, pkgs, auroraTheme, ... }:

{
  stylix = {
    enable = true;

    # Aurora theme colors
    palette = {
      base00 = auroraTheme.colors.background;
      base01 = auroraTheme.colors.surface;
      base02 = "#2A313A";
      base03 = "#5C6B7D";
      base04 = "#9AA5CE";
      base05 = auroraTheme.colors.text;
      base06 = "#FFFFFF";
      base07 = "#FFFFFF";
      base08 = auroraTheme.colors.primary;
      base09 = "#FF9E64";
      base0A = "#EBCB8B";
      base0B = "#A3BE8C";
      base0C = "#88C0D0";
      base0D = auroraTheme.colors.primary;
      base0E = auroraTheme.colors.accent;
      base0F = "#BF616A";
    };

    # Aurora theme fonts
    fonts = {
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      display = {
        package = pkgs.space-grotesk;
        name = "Space Grotesk";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    # Styling options matching Aurora design
    opacity.terminal = auroraTheme.appearance.opacity;
    cursor.package = pkgs.bibata-cursors;

    # Image policy - will be configured with wallpapers later
    image = pkgs.writePixiv.toPixivImage {
      width = 1920;
      height = 1080;
      backgroundColor = auroraTheme.colors.background;
    };
  };
}
