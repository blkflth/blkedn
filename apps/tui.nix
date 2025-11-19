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

  programs.bottom.enable = true;
  programs.numbat.enable = true;
}
