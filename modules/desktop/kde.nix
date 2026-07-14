{ config, lib, pkgs, ... }:

{
  # Enable KDE Plasma as fallback desktop
  services.xserver.desktopManager.plasma6.enable = true;

  # Install essential KDE applications
  environment.systemPackages = with pkgs; [
    dolphin
    konsole
    kate
    spectacle
  ];
}
