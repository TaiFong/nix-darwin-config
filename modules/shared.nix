{ pkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    git
    neovim
    ripgrep
    fd
    tree
  ];

  programs.git = {
    enable = true;
    userName = "TaiFong";
    userEmail = "codefong.c@gmail.com";
  };

  programs.zsh.enable = true;
}

