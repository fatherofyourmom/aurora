{ config, lib, pkgs, ... }:

{
  # Enable Bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  # Install Bluetooth utilities
  environment.systemPackages = with pkgs; [
    blueman
  ];
}
