# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  imports = [
      ../users/jmalloy.nix
      ../machine_hardware/desktop.nix
      ../nvidia.nix
      ../zsh.nix
      ../locale.nix
      ../graphical.nix
      ../services/tailscale.nix
      ../dev_env/c.nix
      ../dev_env/python.nix
      ../dev_env/perf.nix
      ../dev_env/latex.nix
      ../dev_env/tools.nix
    ];




  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  documentation.dev.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget



  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;



  #need this for dual booting windows
  time.hardwareClockInLocalTime = true;

  networking.hostName = "desktop"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;


  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
