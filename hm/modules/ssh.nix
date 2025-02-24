{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "~/.ssh/known_hosts";
    addKeysToAgent = "confirm";
  };

  services.ssh-agent = {
    enable = true;
  };
}
