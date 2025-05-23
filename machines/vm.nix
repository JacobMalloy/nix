# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  networking.hostName = "vm"; # Define your hostname.
  imports = [
      ../grub.nix
      ../nix_general.nix
      ../networking.nix
      ../gpg_agent.nix
      ../users/jmalloy.nix
      ../machine_hardware/vm.nix
      #../nvidia.nix
      ../zsh.nix
      ../locale.nix
      ../graphical/general.nix
      ../graphical/gnome.nix
      #../graphical/i3.nix
      ../services/tailscale.nix
      ../dev_env/c.nix
      #../dev_env/python.nix
      ../dev_env/perf.nix
      #../dev_env/latex.nix
      ../dev_env/tools.nix
      ../services/ssh.nix
      #../rgb.nix
    ];

  #need this for dual booting windows
  time.hardwareClockInLocalTime = true;

}
