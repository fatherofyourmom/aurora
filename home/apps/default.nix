{ config, lib, pkgs, auroraTheme, ... }:

{
  imports = [
    ./apps.nix
    ./terminal.nix
  ];
}
