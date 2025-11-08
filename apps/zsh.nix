{pkgs, ...}: {
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    fzf
    fzf-zsh
    zsh-fzf-tab
  ];

  programs = {
    zsh.enable = true;
  };
}
