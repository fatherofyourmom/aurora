{ config, lib, pkgs, ... }:

{
  # Enable Polkit for authorization
  security.polkit = {
    enable = true;
    extraConfig = ''
      // Allow users in the wheel group to execute any command without password
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };

  # Install polkit agent for authentication dialogs
  environment.systemPackages = with pkgs; [
    polkit_gnome
  ];
}
