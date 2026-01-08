# Yazi Nix Config, 2nd Try. With any luck, importing this into home.nix will install Yazi, show hidden files, and use micro as an editor all at once
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    xdg-desktop-portal-termfilechooser
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        show_hidden = true;
      };
      input = {
        cursor_blink = true;
      };
      confirm = {
        trash = true;
        delete = true;
        overwrite = true;
        quit = false;
      };
      which = {
        sort_sensitive = false;
        sort_translit = true;
      };
      preview = {
        wrap = "yes";
        image_filter = "catmull-rom";
        image_quality = 80;
      };
    };

    plugins = {
      yatline = pkgs.yaziPlugins.yatline;
      yatline-catppuccin = pkgs.yaziPlugins.yatline-catppuccin;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
      sudo = pkgs.yaziPlugins.sudo;
      smart-paste = pkgs.yaziPlugins.smart-paste;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      restore = pkgs.yaziPlugins.restore;
      relative-motions = pkgs.yaziPlugins.relative-motions;
      recycle-bin = pkgs.yaziPlugins.recycle-bin;
      ouch = pkgs.yaziPlugins.ouch;
      mount = pkgs.yaziPlugins.mount;
      mediainfo = pkgs.yaziPlugins.mediainfo;
      jump-to-char = pkgs.yaziPlugins.jump-to-char;
      compress = pkgs.yaziPlugins.compress;
      dupes = pkgs.yaziPlugins.dupes;
    };
  };
}
# Settings
# my own attempt at doing the above, based on https://discourse.nixos.org/t/help-setting-up-yazi-file-opener/42653/6 who had the same issue
# 	opener = {
#		text = [
#			{ run = 'micro "$@", block = true},
#		]
#	};
#	xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;

