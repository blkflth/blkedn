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
  	programs.fzf = {
		enable = true;
	};
  	programs.oh-my-zsh = {
		enable = true;
	};
  	programs.fzf-zsh = {
		enable = true;
	};
  	programs.zsh-fzfz-tab = {
		enable = true;
	};
}
