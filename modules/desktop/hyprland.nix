{ config, lib, pkgs, auroraTheme, ... }:

{
  # Enable Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Install Hyprland utilities
  environment.systemPackages = with pkgs; [
    hyprpicker
    grim
    slurp
    wl-clipboard
    swaynotificationcenter
  ];

  # Configure Hyprland session variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
