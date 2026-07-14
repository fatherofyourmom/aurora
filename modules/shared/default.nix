{ config, lib, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./theme.nix
    ./xdg.nix
  ];
}
