{ config, lib, pkgs, ... }:

{
  # Aurora animation configuration - single source of truth
  # These values are used by Hyprland and other animated components
  
  config = lib.mkIf config.aurora.theme.enable {
    aurora.theme.animations = {
      enable = lib.mkDefault true;
      bezierCurves = lib.mkDefault [
        "easeOutQuad, 0.25, 0.46, 0.45, 0.94"
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"
      ];
      durations = {
        windows = lib.mkDefault 4;
        fade = lib.mkDefault 3;
        workspaces = lib.mkDefault 4;
      };
    };
  };
}
