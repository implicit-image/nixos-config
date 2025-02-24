# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # wsl
      <nixos-wsl/module>
    ];

  wsl.enable = true;
  wsl.defaultUser = "b";
  wsl.startMenuLaunchers = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  git
  vim
  neovim
  btop
  unzip
  gzip
  zip
  ];

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us, pl";
        options = "grp:alt_shift_toggle";
      };
    };
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
   };
  };

  fonts.packages = with pkgs; [
    nerdfonts
    fantasque-sans-mono
  ];

  # enable flake feature
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

}
