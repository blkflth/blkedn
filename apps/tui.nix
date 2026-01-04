{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # clipboard-jh
    # superfile
    numbat
    bottom
    microfetch
    lazygit
    # lazydocker
  ];

  programs = {
    bottom = {
      enable = true;
    };

    numbat = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    #better cd command
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    #better ls command
    eza = {
      enable = true;
      enableFishIntegration = true;
      colors = "always";
      icons = "always";
      git = true;
      extraOptions = [
        "--group-directories-first"
        "--no-time"
        "--no-permissions"
        "--tree"
        "--long"
        "--no-user"
      ];
    };

    #better find command
    fd = {
      enable = true;
      ignores = [
        ".git/"
        "*.bak"
      ];
      hidden = true;
    };

    #better cat command
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
        prettybat
      ];
    };
  };
}
