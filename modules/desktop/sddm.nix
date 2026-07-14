{ config, lib, pkgs, ... }:

{
  # Enable SDDM display manager
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
  };

  # Configure SDDM theme
  services.displayManager.sddm.settings = {
    General = {
      GreeterEnvironment = "QT_QPA_PLATFORM=wayland";
    };
  };

  # Install SDDM themes
  environment.systemPackages = with pkgs; [
    sddm-astronaut-theme
  ];
}
