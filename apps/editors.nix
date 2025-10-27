{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    # micro-with-wl-clipboard
    vscodium-fhs
		# zed-editor
  ];

	#programs.micro = {
		#enable = false;
	#};
  programs.vscodium-fhs = {
		enable = true;
	};
	#programs.zed-editor = {
	#enable = false;
	#};
}
