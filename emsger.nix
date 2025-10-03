{ config, pkgs, ... }:
{
  home.username = "emsger";
  home.homeDirectory = "/home/emsger";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fd
    zoxide
    ripgrep

    bun
    nodejs
    pnpm
    jupyter
    gcc

    keepassxc
    qq
    telegram-desktop
    vlc
    vscode
    yt-dlp

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
    signing.key = "4815D6A57D0AA5EB";
  };

  programs.uv = {
    enable = true;
    settings = {
      pip.index-url = "https://mirrors.ustc.edu.cn/pypi/web/simple";
    };
  };

  xdg.dataFile."fcitx5/rime/default.custom.yaml".source = (pkgs.formats.yaml { }).generate "default.custom.yaml" {
    patch = {
      __include = "rime_ice_suggestion:/";
    };
  };
}
