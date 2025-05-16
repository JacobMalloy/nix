# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,pkgs-unstable, ... }:

{


  environment.systemPackages = (with pkgs; [
    git
    vim
    pkgs-unstable.neovim
    tmux
    ripgrep
    ctags
    htop
    curl
    perl
    openssl
    bash
    coreutils-full
    gnugrep
    file
    less
    gawk
    wget
    rustup
    mosh
    imagemagick
  ]);



  system.stateVersion = "23.11"; # Did you read the comment?

}
