{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./hyprland.nix
    ./kde.nix
    ./sddm.nix
    ./stylix.nix
  ];
}
