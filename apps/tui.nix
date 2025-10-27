{ pkgs, lib, ... }:
{
	home.packages = with pkgs; [
    clipboard-jh
    superfile
    numbat
    bottom
    microfetch
  ];

	programs.clipboard-jh = {
		enable = true;
	};
    programs.superfile = {
		enable = true;
	};
    programs.numbat = {
		enable = true;
	};
    programs.bottom = {
		enable = true;
	};
    programs.microfetch = {
		enable = true;
	};
}
