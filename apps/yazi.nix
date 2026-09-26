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

    plugins = with pkgs.yaziPlugins; {
      git.package = git;
      sudo.package = sudo;
      ouch.package = ouch;
      mount.package = mount;
      office.package = office;
      piper.package = piper;
      lazygit.package = lazygit;
      chomd.package = chomd;
      restore.package = restore;
      yatline.package = yatline;
      dupes.package = dupes;
      smart-paste.package = smart-paste;
      mediainfo.package = mediainfo;
      smart-enter.package = smart-enter;
      sshfs.package = sshfs;
      relative-motions.package = relative-motions;
      rich-preview.package = rich-preview;
      compress.package = compress;
      convert.package = convert;
      clipboard.package = clipboard;
      close-and-restore-tab.package = close-and-restore-tab;
    };
  };
}
#	xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;

