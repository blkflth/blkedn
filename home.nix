{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.username = "jlc";
  home.homeDirectory = "/home/jlc";

  imports = [
    inputs.vicinae.homeManagerModules.default
    ./rice/rice.nix
    ./apps/apps.nix
    ./hw/hw.nix
  ];

  home.stateVersion = "25.05"; # Don't Change This.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  ];

  /*
  #XDG MIMETYPES (This is how files know what to open)
  xdg = {
    # Don't generate config at the usual place.
    # Allow desktop applications to write their file association
    # preferences to this file.
    configFile."mimeapps.list".enable = false;
    # Home-manager also writes xdg-mime-apps configuration to the
    # "deprecated" location. Desktop applications will look in this
    # list for associations, if no association was found in the
    # previous config file.
    dataFile."applications/mimeapps.list".force = true;
    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = ["org.kde.dolphin.desktop"]; # Directories
        "text/plain" = ["codium.desktop"]; # Plain text
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["writer.desktop"]; # .docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["impress.desktop"]; # .pptx
        "application/pdf" = ["draw.desktop"]; # .pdf
        "application/zip" = ["xarchiver.desktop"];
        "text/*" = ["codium.desktop"]; # Any text files
        "video/*" = ["vlc.desktop"]; # Any video files
        "x-scheme-handler/https" = ["firefox.desktop"]; # Links
        "x-scheme-handler/http" = ["firefox.desktop"]; # Links
        "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
        "image/*" = [
          "feh.desktop"
          "net.lutris.affinity-canva-30.desktop"
        ]; # Images
        "image/png" = [
          "feh.desktop"
          "net.lutris.affinity-canva-30.desktop"
        ];
        "image/jpeg" = [
          "feh.desktop"
          "net.lutris.affinity-canva-30.desktop"
        ];
      };
    };
  };
  */

  /*
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "frappeDark";
    size = 24;
  };
  */

  #force override of files so home-manager doesn't throw a warning

  gtk.gtk2.force = true;
  # home.file.".config/gtk-3.0".force = true;
  # home.file.".config/gtk-3.0/settings.ini".force = true;
  # home.file.".config/gtk-4.0/".force = true;
  # home.file.".config/gtk-4.0/settings.ini".force = true;

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
