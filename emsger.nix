{ config, pkgs, ... }:
{
  home.username = "emsger";
  home.homeDirectory = "/home/emsger";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fd
    zoxide

    clash-verge-rev
    keepassxc
    qq
    telegram-desktop
    vscode

    prismlauncher
  ];

  home.sessionVariables.EDITOR = "vim";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      lh = "ls -lh";
    };
  };

  programs.git = {
    enable = true;
    userName = "EarthMessenger";
    userEmail = "me@earthmessenger.xyz";
  };
}
