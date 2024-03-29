# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "amd";

  environment.systemPackages = (with pkgs; [
      openrgb-with-all-plugins
  ]);

}
