{ config, lib, pkgs, ... }:

{
  # Define a default user
  users.users.aurora = {
    isNormalUser = true;
    description = "Aurora User";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
      "plugdev"
    ];
    shell = pkgs.fish;
  };

  # Set initial password (should be changed after first login)
  users.users.aurora.initialPassword = "aurora";

  # Enable sudo for wheel group
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;
}
