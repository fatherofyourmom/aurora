{ config, lib, pkgs, auroraTheme, ... }:

{
  imports = [
    ./git.nix
    ./packages.nix
  ];
}
