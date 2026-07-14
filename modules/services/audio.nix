{ config, lib, pkgs, ... }:

{
  # Enable PipeWire audio server
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # Configure audio settings
    extraConfig.pipewire."99-audio-config" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 2048;
      };
    };
  };

  # Install audio utilities
  environment.systemPackages = with pkgs; [
    pamixer
    playerctl
    pavucontrol
  ];
}
