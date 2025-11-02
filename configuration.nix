# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./host/host-configuration.nix 
      ./hw/virt.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.matugen.nixosModules.default
      
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # kernel modules for system fan control
  boot.kernelModules = [ "nct6775" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Home Manager
  home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "jlc" = import ./home.nix;
    };
  };
  
/*
  # Define a user account. set a password with ‘passwd’.
  users.users.jlc = {
    isNormalUser = true;
    description = "JLC";
    extraGroups = [ "networkmanager" "wheel" "kvm" "libvirtd" ];
    packages = with pkgs; [
    #  kdePackages.kate #useful to have on hand tbh!
    #  thunderbird
    ];
  };

  # Define hostname.
  networking.hostName = "blkedn";

  # Enable networking
  networking.networkmanager.enable = true;
  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Enable System Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
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

  # enable portals for spawning extra windows
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = [ "gnome" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome  ];
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
    # Noctalia startup service
    noctalia-shell.enable = true;
    # SDDM display Manager
    displayManager.sddm.enable = true;
    # Enable the X11 windowing system.
    xserver.enable = true;
    # KDE Plasma - here just in case
    # desktopManager.plasma6.enable = true;
    # Enable Bluetooth control
    blueman.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "jlc";
  };





  # Mount Points for SSDs
  fileSystems."/run/media/jlc/SSD One" = {
  device = "/dev/disk/by-uuid/0A4A387B4A38661B";
  fsType = "ntfs3";
  options = [ "nofail" "defaults" ];
  };

  fileSystems."/run/media/jlc/SSD Two" = {
  device = "/dev/disk/by-uuid/7ABA5750BA570851";
  fsType = "ntfs3";
  options = [ "nofail" "defaults" ];
  };

  fileSystems."/run/media/jlc/SSD Three" = {
  device = "/dev/disk/by-uuid/027CB1E67CB1D49F";
  fsType = "ntfs3";
  options = [ "nofail" "defaults" ];
  };



  # See what of these can be put in home-manager
  environment.systemPackages = with pkgs; [
    # system tools
    bluez-headers # bluetooth enabling
    alejandra #nix language formatting
    nix-init #tool of building packages
    unar #unarchive tools
    glibc #c language library
    gnumake # 'make' commands
    wev #find keystrokes for wayland compsitor; helpful when altering keybinds
    nix-output-monitor
    nvd

    docker
    docker-compose

    # git
    git
    gh #github cli tools

    # package managers
    wget
    curl
    apt

    # general use and media
    nautilus #GNOME file browser
    # kdePackages.dolphin # KDE file browser
    davinci-resolve
    gimp3-with-plugins
    inkscape-with-extensions 
    feishin # Subsonic interface
    ani-cli #CLI anime streaming
    nyaa # cli torrent downloader - see if this can be linked to media server
    nicotine-plus # soulseek client

    # music metadata editors
    picard

     for hardware control -
    thought these weren't necessary but 
    CoolerControl's daemon was having issues.
    lm_sensors
    fanctl

    # display shenangians
    xdg-utils
    xdg-desktop-portal-gtk
    xdg-desktop-portal-termfilechooser
    xwayland-satellite

    # styling tools
    # base16-schemes
    inputs.matugen.packages.x86_64-linux.default

    # game/3d tools
    blender
    protonup-ng #installed proton GE
    protonup-qt #GUI for managing Proton GE
    mangohud #process overlay
    xivlauncher

    # cursors + fonts + icons
    bibata-cursors
    catppuccin-cursors
    nerd-fonts.atkynson-mono
    montserrat
    noto-fonts-emoji-blob-bin
    adwaita-icon-theme

  ];

  # enable docker virtualizsation
  virtualisation.docker = {
    enable = true;
  };





  # Enable programs defined by Home Manager modules.

    programs = {
      coolercontrol.enable = true;
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      gamemode.enable = true;
      virt-manager.enable = true;
      firefox.enable = true;
    # enable Niri Window Manager - NixOS source in flake, builds using cachix
      niri.enable = true;
      niri.package = pkgs.niri-stable;
    };
      niri-flake.cache.enable = false; #uncomment once cache is built

  # cachix sources
    nix.settings = {
      substituters = [
        "https://vicinae.cachix.org"
      ];

      trusted-public-keys = [
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      ];
    };

  # VSCode Config Source

 
  programs.vscode = {
    home.file = { 
        ".config/Code/User/settings.json".source = 
        lib.mkForce (
          config.lib.file.mkOutOfStoreSymlink 
          /home/jlc/Nix/settings/vscode-settings.json
        );
    };
  };

*/


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
