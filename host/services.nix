{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Enable networking
  networking.networkmanager.enable = true;
  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Enable System Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Audio services - Pipewire by default
  services.pulseaudio.enable = false; #this is mutually exclusive w/ pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # enable Qt Configuuration, including theming
  qt = {
    enable = true;
  };

  # enable portals for spawning extra windows
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = [
          "gnome"
        ];
      };
      niri = {
        default = [
          "gnome"
        ];
        "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        "org.freedesktop.impl.portal.OpenURI" = ["kde"];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
        /*
        "org.freedesktop.impl.portal.Access" = ["kde"];
        "org.freedesktop.impl.portal.Account" = ["kde"];
        "org.freedesktop.impl.portal.Notification" = ["kde"];
        "org.freedesktop.impl.portal.Settings" = ["kde"];
        "org.freedesktop.impl.portal.RemoteDesktop" = ["kde"];
        "org.freedesktop.impl.portal.Print" = ["kde"];
        */
      };
    };
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.sessionVariables = {
    # Niri-Flake setting for electron apps
    NIXOS_OZONE_WL = "1";
  };

  # Nix CLI Helper tool, including flake paths for commands
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    # flake = "~/Nix"; find out how tf this string needs to be written
  };

  # Automatic Nix Store Management - Handling Garbage collection w/ nh's functions above
  nix = {
    optimise.automatic = true;
    settings.auto-optimise-store = true;
  };

  # General services
  services = {
    # Video driver
    xserver.videoDrivers = ["amdgpu"];
    # GPU Conig Tool
    lact = {
      enable = true;
    };

    /*
       Noctalia systemd service -
    Use if not starting shell from Niri, such as if using only
    Niri with no other Desktop Environments

    noctalia-shell.enable = true;

    */
    /*
    # SDDM display Manager
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "jlc";
    */

    # Enable the X11 windowing system.
    xserver.enable = true;

    # KDE Plasma - here just in case
    # desktopManager.plasma6.enable = true;

    # Enable Bluetooth control
    blueman.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;
  };
}
