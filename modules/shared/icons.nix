{ config, lib, pkgs, ... }:

{
  # Aurora icon configuration - single source of truth
  # These values are used by GTK, Qt, and other components
  
  config = lib.mkIf config.aurora.theme.enable {
    aurora.theme.icons = {
      gtk = lib.mkDefault "Adwaita";
      cursor = lib.mkDefault "Bibata-Modern-Classic";
      cursorSize = lib.mkDefault 24;
    };
  };
}
