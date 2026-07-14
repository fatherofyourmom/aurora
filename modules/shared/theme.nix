{ config, lib, pkgs, ... }:

{
  # Aurora theme - applies all theme-related settings
  # This module enables the theme and imports all sub-modules
  
  imports = [
    ./colors.nix
    ./fonts.nix
    ./icons.nix
    ./animations.nix
  ];
  
  config = {
    aurora.theme.enable = lib.mkDefault true;
  };
}
