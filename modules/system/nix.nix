{ config, lib, pkgs, ... }:

{
  nix = {
    # Enable flakes and the new command
    settings.experimental-features = [ "nix-command" "flakes" ];

    # Garbage collection settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    # Optimize storage
    optimise.automatic = true;

    # Allow unfree packages (required for some desktop components)
    settings.allow-unfree = true;
  };
}
