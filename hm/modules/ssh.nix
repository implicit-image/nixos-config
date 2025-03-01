{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "~/.ssh/known_hosts";
    addKeysToAgent = "confirm";
    package = pkgs.openssh;
  };

  services.ssh-agent = {
    enable = true;
  };
}
