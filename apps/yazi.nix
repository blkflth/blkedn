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
    shellWrapperName = "y";

    plugins = with pkgs.yaziPlugins; {
      git.package = git;
      ouch.package = ouch;
      mount.package = mount;
      office.package = office;
      piper.package = piper;
      lazygit.package = lazygit;
      chmod.package = chmod;
      yatline.package = yatline;
      dupes.package = dupes;
      smart-paste.package = smart-paste;
      smart-enter.package = smart-enter;
      sshfs.package = sshfs;
      relative-motions.package = relative-motions;
      rich-preview.package = rich-preview;
      compress.package = compress;
      convert.package = convert;
      close-and-restore-tab.package = close-and-restore-tab;
    };
  };
}
#	xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;

