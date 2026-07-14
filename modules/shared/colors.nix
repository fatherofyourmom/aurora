{ config, lib, pkgs, ... }:

{
  # Aurora color palette - single source of truth
  # These values are used by GTK, Qt, Hyprland, and other components
  
  config = lib.mkIf config.aurora.theme.enable {
    aurora.theme.colors = {
      background = lib.mkDefault "#111318";
      surface = lib.mkDefault "#181C23";
      primary = lib.mkDefault "#7AA2F7";
      accent = lib.mkDefault "#CBA6F7";
      text = lib.mkDefault "#E6EDF3";
    };
  };
}
