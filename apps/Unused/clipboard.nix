{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clipboard-jh
  ];

	programs.clipboard-jh = {
		enable = true;
	};
}