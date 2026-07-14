{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./networking.nix
    ./polkit.nix
    ./power.nix
    ./printing.nix
  ];
}
