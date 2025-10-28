# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
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

  # Home Manager
  home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "jlc" = import ./home.nix;
    };
  };



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jlc = {
    isNormalUser = true;
    description = "JLC";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate #useful to have on hand tbh!
    #  thunderbird
    ];
  };



  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 21d";
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



  #enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };



  # General services
  services = {
    # Video driver
    xserver.videoDrivers = ["amdgpu"];
    # Noctalia startup service
    noctalia-shell.enable = true;
    # Enable the KDE Plasma Desktop Environment. Keeping this enabled for testing
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver.enable = true;
    # Enable Bluetooth
    blueman.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "jlc";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Niri-Flake setting for electron apps
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    };

  # enable Stylix here, as it's installed as a NixOS Module and not a H-M one
   stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/chalk.yaml";
    };



  # Audio services - Pipewire by default
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };



  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "blkedn"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # will break these out to home manager ASAP
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bibata-cursors
    catpuccin-cursors
    nerd-fonts.atkynson-mono
    montserrat
    noto-fonts-emoji-blob-bin
    base16-schemes
  ];

  # Enable programs defined by Home Manager modules.

    programs = {
      coolercontrol.enable = true;
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      gamemode.enable = true;
      virt-manager.enable = true;
      firefox.enable = true;
      # enable Niri Window Manager - NixOS source in flake
      # niri.enable = true; #unneeded since importing from sodiboo flake
    };

    /*

    Remove everything within this comment if the above section functions as intended.

	programs.steam = {
		enable = true;
		gamescopeSession.enable = true;
	};

	programs.gamemode = {
		enable = true;
	};

    programs.virt-manager = {
      enable = true;
	};

    programs.firefox = {
      enable = true;
	};

    programs.zsh = {
      enable = true;
	};
	*/


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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
