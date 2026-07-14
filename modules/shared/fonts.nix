{ config, lib, pkgs, ... }:

{
  # Aurora font configuration - single source of truth
  # These values are used by GTK, Qt, terminals, and other components
  
  config = lib.mkIf config.aurora.theme.enable {
    aurora.theme.fonts = {
      sans = lib.mkDefault "Inter";
      mono = lib.mkDefault "JetBrains Mono Nerd Font";
      display = lib.mkDefault "Space Grotesk";
      emoji = lib.mkDefault "Noto Emoji";
    };
  };
}
