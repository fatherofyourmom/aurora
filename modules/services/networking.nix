{ config, lib, pkgs, ... }:

{
  # Enable NetworkManager for network management
  networking.networkmanager.enable = true;

  # Configure DNS
  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];

  # Enable IPv6 support
  networking.enableIPv6 = true;

  # Install network utilities
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
