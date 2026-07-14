{ config, lib, pkgs, ... }:

{
  options.aurora = {
    theme = {
      enable = lib.mkEnableOption "Aurora theme";
      colors = {
        background = lib.mkOption {
          type = lib.types.str;
          default = "#111318";
          description = "Background color";
        };
        surface = lib.mkOption {
          type = lib.types.str;
          default = "#181C23";
          description = "Surface color";
        };
        primary = lib.mkOption {
          type = lib.types.str;
          default = "#7AA2F7";
          description = "Primary accent color";
        };
        accent = lib.mkOption {
          type = lib.types.str;
          default = "#CBA6F7";
          description = "Secondary accent color";
        };
        text = lib.mkOption {
          type = lib.types.str;
          default = "#E6EDF3";
          description = "Text color";
        };
      };
      fonts = {
        sans = lib.mkOption {
          type = lib.types.str;
          default = "Inter";
          description = "Sans-serif font";
        };
        mono = lib.mkOption {
          type = lib.types.str;
          default = "JetBrains Mono Nerd Font";
          description = "Monospace font";
        };
        display = lib.mkOption {
          type = lib.types.str;
          default = "Space Grotesk";
          description = "Display font";
        };
        emoji = lib.mkOption {
          type = lib.types.str;
          default = "Noto Emoji";
          description = "Emoji font";
        };
      };
      appearance = {
        radius = lib.mkOption {
          type = lib.types.int;
          default = 12;
          description = "Corner radius in pixels";
        };
        gaps = lib.mkOption {
          type = lib.types.int;
          default = 8;
          description = "Window gaps in pixels";
        };
        opacity = lib.mkOption {
          type = lib.types.float;
          default = 0.9;
          description = "Window opacity";
        };
        blur = lib.mkEnableOption "blur effects";
      };
    };
  };

  config = lib.mkIf config.aurora.theme.enable {
    aurora.theme = {
      colors = {
        background = lib.mkDefault "#111318";
        surface = lib.mkDefault "#181C23";
        primary = lib.mkDefault "#7AA2F7";
        accent = lib.mkDefault "#CBA6F7";
        text = lib.mkDefault "#E6EDF3";
      };
      fonts = {
        sans = lib.mkDefault "Inter";
        mono = lib.mkDefault "JetBrains Mono Nerd Font";
        display = lib.mkDefault "Space Grotesk";
        emoji = lib.mkDefault "Noto Emoji";
      };
      appearance = {
        radius = lib.mkDefault 12;
        gaps = lib.mkDefault 8;
        opacity = lib.mkDefault 0.9;
        blur = lib.mkDefault true;
      };
    };
  };
}
