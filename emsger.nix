{ config, pkgs, ... }:
{
  home.username = "emsger";
  home.homeDirectory = "/home/emsger";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fd
    jq
    zoxide
    ripgrep

    bun
    nodejs
    pnpm
    jupyter
    gcc

    nil
    nixd

    keepassxc
    qq
    telegram-desktop
    vlc
    vscode
    yt-dlp
    zed-editor
    anki-bin

    libreoffice-qt
    hunspell

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
      la = "ls -a";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "EarthMessenger";
        email = "me@earthmessenger.xyz";
        signingKey = "4815D6A57D0AA5EB";
      };
      http = {
        proxy = "http://localhost:7897";
      };
    };
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

  fonts.fontconfig = {
    defaultFonts = {
      emoji = [
        "Twitter Color Emoji"
      ];
      monospace = [
        "Iosevka"
      ];
      sansSerif = [
        "Noto Sans CJK TC"
      ];
      serif = [
        "Noto Serif CJK TC"
      ];
    };
  };
}
