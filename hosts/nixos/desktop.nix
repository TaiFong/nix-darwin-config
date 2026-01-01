{ config, pkgs, ... }:

{
  system.stateVersion = "23.11";

  networking.hostName = "desktop";

  time.timeZone = "America/Los_Angeles";

  users.users.iat = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];
}

