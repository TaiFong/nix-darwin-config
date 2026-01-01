{ pkgs, ... }:

{
  networking.hostName = "laptop";

  users.users.iat = {
    home = "/Users/iat";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  programs.zsh.enable = true;

  system.stateVersion = 4;
}

