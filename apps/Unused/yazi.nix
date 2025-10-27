# Yazi Nix Config, 2nd Try. With any luck, importing this into home.nix will install Yazi, show hidden files, and use micro as an editor all at once

{ pkgs, lib, ... }: 
{
	home.packages = with pkgs; [
    yazi
  ];

	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
	};
	# Plugins
  programs.yazi.yaziPlugins = {
    enable = true;
    plugins = {
      starship.enable = true;
      jump-to-char = {
        enable = true;
        keys.toggle.on = [ "F" ];
      };
			ouch.enable = true;
			system-clipboard.enable = true;
			full-border.enable = true;

    };
  };


	# Settings
	log = {
		enabled = false;
	};

	mgr = {
		show_hidden = true;
	};

	settings = {
		opener = {
			edit = [
				{ block = true, run = 'micro "$@"',}
			];
		};
	};

	# my own attempt at doing the above, based on https://discourse.nixos.org/t/help-setting-up-yazi-file-opener/42653/6 who had the same issue
	# 	opener = {
	#		text = [
	#			{ run = 'micro "$@", block = true},
	#		]
	#	};

	#	xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
}
