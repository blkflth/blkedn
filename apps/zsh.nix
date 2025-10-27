{ pkgs, ... }:

{

  home.packages = with pkgs; [
    zsh
  	oh-my-zsh
    fzf
    fzf-zsh
    zsh-fzfz-tab
  ];

	programs.zsh = {
		enable = true;
	};

}
