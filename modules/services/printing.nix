{ config, lib, pkgs, ... }:

{
  # Enable CUPS for printing
  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = false;
  };

  # Enable Avahi for printer discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Install printing utilities
  environment.systemPackages = with pkgs; [
    cups
    cups-filters
  ];
}
