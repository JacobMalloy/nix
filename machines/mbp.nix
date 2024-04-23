# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  networking.hostName = "desktop"; # Define your hostname.
  imports = [
      ../nix_general.nix
      ../dev_env/tools.nix
    ];

  #need this for dual booting windows
  #time.hardwareClockInLocalTime = true;

}
