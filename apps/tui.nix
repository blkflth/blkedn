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

    eza = {
      enable = true;
      enableFishIntegration = true;
      colors = "always";
      icons = "always";
      git = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };

    fd = {
      enable = true;
      ignores = [
        ".git/"
        "*.bak"
      ];
      hidden = true;
    };

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
