# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      inputs.noctalia.nixosModules.default
      inputs.niri.nixosModules.niri
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # kernel modules for system fan control
  boot.kernelModules = [ "nct6775" ];

  #Mount Points for SSDs
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


  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  #video driver enable
  services.xserver.videoDrivers = ["amdgpu"];

  networking.hostName = "blkedn"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Home Manager
  home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "jlc" = import ./home.nix;
    };
  };

  # enable Niri Window Manager - NixOS source in flake
  programs.niri.enable = true;

  # enable the noctalia systemd service
  services.noctalia-shell.enable = true;

  # Enable the KDE Plasma Desktop Environment.
   services.displayManager.sddm.enable = true;
   services.desktopManager.plasma6.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable networking
  networking.networkmanager.enable = true;

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



  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jlc = {
    isNormalUser = true;
    description = "JLC";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };


  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jlc";

  # Install firefox.
  programs.firefox.enable = true;

  # Install System Tuning Packages
  # hardware.fancontrol.enable = true;
  programs.coolercontrol.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # will break these out to home manager ASAP
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # utils
    glibc
    wget
    curl
    apt
    git
    xdg-utils
    blueberry
    gnumake
    lm_sensors
    fanctl
    bottom
    #programs
    kdePackages.dolphin
    microfetch
    fuzzel
    nomacs
    #style
    nerd-fonts.atkynson-mono
    pywalfox-native




  ];

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

  # Automatic Garbage Collection
nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 21d";
        };

}
