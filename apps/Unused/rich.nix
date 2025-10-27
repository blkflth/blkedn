{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rich-cli
  ];

	programs.rich-cli = {
		enable = true;
	};
}