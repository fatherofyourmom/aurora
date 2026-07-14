{ config, lib, pkgs, ... }:

{
  # Enable hardware acceleration
  hardware = {
    # OpenGL support
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    # Enable firmware updates
    firmware = with pkgs; [
      linux-firmware
    ];
  };

  # Enable udev for device management
  services.udev.enable = true;
}
