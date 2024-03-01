# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{


  environment.systemPackages = (with pkgs; [
    vim
    ripgrep
    ctags
    htop
    curl
    perl
    openssl
    bash
    coreutils-full
    grep
    file
    less
    gawk
  ]);



  system.stateVersion = "23.11"; # Did you read the comment?

}
