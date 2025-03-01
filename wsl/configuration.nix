{ config, pkgs, ... }:

{
  imports =
    [
      # wsl
      #<nixos-wsl/module>
    ];

  #wsl.enable = true;
  #wsl.defaultUser = "b";
  #wsl.startMenuLaunchers = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
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
    # sessionVariables = {
    #   DISPLAY=":0";
    #   LIBGL_ALWAYS_INDIRECT=1;
    #   GDK_SCALE=1;
    #   GDK_DPI_SCALE=2;
    # };
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
    dconf.enable = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
    fantasque-sans-mono
  ];

  # enable flake feature
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

}
